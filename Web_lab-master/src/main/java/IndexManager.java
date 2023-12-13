//import org.elasticsearch.action.admin.indices.create.CreateIndexRequest;
//import org.elasticsearch.action.admin.indices.create.CreateIndexResponse;
//import org.elasticsearch.client.RequestOptions;
//import org.elasticsearch.client.RestHighLevelClient;
//
//import java.io.IOException;
//
//public class IndexManager {
//    private RestHighLevelClient client;
//
//    public IndexManager(Object client) {
//
//    }
//
//    // 构造函数...
//
//    public void createIndex(String indexName) throws IOException {
//        CreateIndexRequest request = new CreateIndexRequest(indexName);
//
//        // 设置索引的映射
//        // request.mapping(...);
//
//        CreateIndexResponse response = client.indices().create(request, RequestOptions.DEFAULT);
//        if (response.isAcknowledged()) {
//            System.out.println("索引创建成功");
//        } else {
//            System.out.println("索引创建失败");
//        }
//    }
//
//    // 其他操作方法...
//}
