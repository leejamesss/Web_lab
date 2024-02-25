from flask import Flask, request, jsonify
import mysql.connector
import numpy as np
from tensorflow.keras.applications.vgg16 import VGG16, preprocess_input
from tensorflow.keras.preprocessing import image
from sklearn.neighbors import NearestNeighbors

class BookMatcher:
    def __init__(self, db_config):
        self.model = VGG16(weights='imagenet', include_top=False)
        self.db_config = db_config
        self.books_db = self._get_books_db()
        self.features_db = self._build_features_db()
        self.neighbors_model = self._build_neighbors_model()

    def _get_books_db(self):
        cnx = mysql.connector.connect(**self.db_config)
        cursor = cnx.cursor(dictionary=True)
        query = "SELECT * FROM bookinfo"
        cursor.execute(query)
        books_db = cursor.fetchall()
        cursor.close()
        cnx.close()
        for book in books_db:
            book['cover_image_path'] = './photos/' + book['cover_image_path']
        return books_db

    def _extract_features(self, img_path):
        img = image.load_img(img_path, target_size=(224, 224))
        img_array = image.img_to_array(img)
        expanded_img_array = np.expand_dims(img_array, axis=0)
        preprocessed_img = preprocess_input(expanded_img_array)
        features = self.model.predict(preprocessed_img)
        flattened_features = features.flatten()
        normalized_features = flattened_features / np.linalg.norm(flattened_features)
        return normalized_features

    def _build_features_db(self):
        features_db = {}
        for book in self.books_db:
            features_db[book['id']] = self._extract_features(book['cover_image_path'])
            ###TODO: bookinfo 表需要增加id, cover_image_path字段：格式为xxx.jpg
        return features_db

    def _build_neighbors_model(self):
        neighbors_model = NearestNeighbors(n_neighbors=5, algorithm='ball_tree')
        neighbors_model.fit(list(self.features_db.values()))
        return neighbors_model

    def match_book(self, uploaded_image_path):
        uploaded_image_features = self._extract_features(uploaded_image_path)
        distances, indices = self.neighbors_model.kneighbors([uploaded_image_features])
        matched_book_ids = [list(self.features_db.keys())[i] for i in indices.flatten()]
        matched_books = [self.books_db[id] for id in matched_book_ids]
        return matched_books

db_config = {
    'user': 'root',
    'password': 'rzYXj=2u-=lD',
    'host': 'localhost',
    'database': 'library',
}

app = Flask(__name__)
book_matcher = BookMatcher(db_config)

@app.route('/match_book', methods=['POST'])
def match_book():
    if 'file' not in request.files:
        return jsonify({'error': 'No file part'}), 400
    file = request.files['file']
    if file.filename == '':
        return jsonify({'error': 'No selected file'}), 400
    if file:
        matched_books = book_matcher.match_book(file)
        return jsonify(matched_books)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)