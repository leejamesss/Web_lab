//import javax.swing.text.Document;
//import java.io.IOException;
//import java.util.List;
//
//
//
//
//public class ES_Main {
//    public static void main(String[] args) {
//
//
//        ElasticsearchConnector connector = new ElasticsearchConnector();
//        connector.connect();
//
//        IndexManager indexManager = new IndexManager(connector.getClient());
//        String indexName = "books"; // 索引名称
//        try {
//            indexManager.createIndex(indexName);
//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }
//
//        DataHandler dataHandler = new DataHandler(connector.getClient());
//
//        String documentId = "1"; // 文档ID
//        String jsonData = "{\"title\": \"Java编程\", \"author\": \"张三\", \"price\": 50.0}"; // 文档内容(JSON格式)
//        try {
//            dataHandler.indexDocument(indexName, documentId, jsonData);
//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }
//
//
//        SearchHandler searchHandler = new SearchHandler(connector.getClient());
//
//        String searchTerm = "Java"; // 搜索关键词
//        List<Document> results = searchHandler.searchDocuments(indexName, searchTerm);
//        // 处理搜索结果
//
//
//        try {
//            connector.close();
//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }
//
//    }
//}


public class ES_Main {
    public static void main(String[] args) {
        String template = "{role:\"user\",content:`你好，%s`}";
        String parameter = "张三";
        String json = String.format(template, parameter);
        System.out.println(json);
    }
}
