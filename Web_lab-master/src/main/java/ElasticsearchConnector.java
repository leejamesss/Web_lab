//import org.apache.http.HttpHost;
//import org.elasticsearch.client.RestClient;
//import org.elasticsearch.client.RestHighLevelClient;
//
//import java.io.IOException;
//
//public class ElasticsearchConnector {
//    private final String HOST = "localhost";
//    private final int PORT = 9200;
//
//    private RestHighLevelClient client;
//
//    public void connect() {
//        client = new RestHighLevelClient(
//                RestClient.builder(new HttpHost(HOST, PORT, "http"))
//        );
//    }
//
//    public void close() throws IOException {
//        client.close();
//    }
//
//    public Object getClient() {
//        return client;
//    }
//
//    // 其他操作方法...
//}
