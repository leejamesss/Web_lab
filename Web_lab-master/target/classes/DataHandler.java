//import org.elasticsearch.action.DocWriteResponse;
//import org.elasticsearch.action.index.IndexRequest;
//import org.elasticsearch.action.index.IndexResponse;
//import org.elasticsearch.client.RequestOptions;
//import org.elasticsearch.client.RestHighLevelClient;
//import org.elasticsearch.common.xcontent.XContentType;
//
//import java.io.IOException;
//
//public class DataHandler {
//    private RestHighLevelClient client;
//
//    public DataHandler(Object client) {
//
//    }
//
//    // 构造函数...
//
//    public void indexDocument(String index, String documentId, String jsonData) throws IOException, IOException {
//        IndexRequest request = new IndexRequest(index)
//                .id(documentId)
//                .source(jsonData, XContentType.JSON);
//
//        IndexResponse response = client.index(request, RequestOptions.DEFAULT);
//        if (response.getResult() == DocWriteResponse.Result.CREATED) {
//            System.out.println("文档索引成功");
//        } else if (response.getResult() == DocWriteResponse.Result.UPDATED) {
//            System.out.println("文档更新成功");
//        } else {
//            System.out.println("文档索引失败");
//        }
//    }
//
//    // 其他操作方法...
//}
