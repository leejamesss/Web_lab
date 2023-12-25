import java.util.*;

public class UserBasedCollaborativeFiltering {
    private Map<String, Map<String, Double>> userRatings;
    private Map<String, List<String>> itemUsers;

    public UserBasedCollaborativeFiltering(Map<String, Map<String, Double>> userRatings) {
        this.userRatings = userRatings;
        this.itemUsers = new HashMap<>();

        // 构建物品-用户倒排表
        for (String user : userRatings.keySet()) {
            Map<String, Double> ratings = userRatings.get(user);
            for (String item : ratings.keySet()) {
                if (!itemUsers.containsKey(item)) {
                    itemUsers.put(item, new ArrayList<>());
                }
                itemUsers.get(item).add(user);
            }
        }
    }

    public double calculateSimilarity(Map<String, Double> user1Ratings, Map<String, Double> user2Ratings) {
        // 计算用户1的评分向量的模
        double user1Norm = 0.0;
        for (double rating : user1Ratings.values()) {
            user1Norm += rating * rating;
        }
        user1Norm = Math.sqrt(user1Norm);

        // 计算用户2的评分向量的模
        double user2Norm = 0.0;
        for (double rating : user2Ratings.values()) {
            user2Norm += rating * rating;
        }
        user2Norm = Math.sqrt(user2Norm);

        // 计算用户1和用户2的内积
        double dotProduct = 0.0;
        for (String item : user1Ratings.keySet()) {
            if (user2Ratings.containsKey(item)) {
                dotProduct += user1Ratings.get(item) * user2Ratings.get(item);
            }
        }

        // 计算余弦相似度
        if (user1Norm > 0 && user2Norm > 0) {
            return dotProduct / (user1Norm * user2Norm);
        } else {
            return 0.0; // 如果某个用户的评分向量为空，则相似度为0
        }
    }


    public List<String> recommendItems(String targetUser, int numRecommendations) {
        // 计算目标用户与其他用户的相似度
        Map<String, Double> userSimilarities = new HashMap<>();
        for (String user : userRatings.keySet()) {
            if (!user.equals(targetUser)) {
                double similarity = calculateSimilarity(userRatings.get(targetUser), userRatings.get(user));
                userSimilarities.put(user, similarity);
            }
        }

        // 根据相似度进行排序
        List<Map.Entry<String, Double>> sortedSimilarities = new ArrayList<>(userSimilarities.entrySet());
        sortedSimilarities.sort(Map.Entry.comparingByValue(Comparator.reverseOrder()));

        // 选择相似度最高的K个用户
        List<String> similarUsers = new ArrayList<>();
        for (int i = 0; i < numRecommendations; i++) {
            if (i < sortedSimilarities.size()) {
                similarUsers.add(sortedSimilarities.get(i).getKey());
            } else {
                break;
            }
        }

        // 获取相似用户喜欢的物品，并进行推荐
        Set<String> recommendations = new HashSet<>();
        for (String user : similarUsers) {
            Map<String, Double> ratings = userRatings.get(user);
            for (String item : ratings.keySet()) {
                if (!userRatings.get(targetUser).containsKey(item)) {
                    recommendations.add(item);
                }
            }
        }

        // 排序推荐物品
        List<String> sortedRecommendations = new ArrayList<>(recommendations);
        sortedRecommendations.sort((item1, item2) -> {
            double rating1 = userRatings.get(targetUser).getOrDefault(item1, 0.0);
            double rating2 = userRatings.get(targetUser).getOrDefault(item2, 0.0);
            return Double.compare(rating2, rating1);
        });

        // 取前N个推荐物品
        int numItems = Math.min(numRecommendations, sortedRecommendations.size());
        return sortedRecommendations.subList(0, numItems);
    }

    public static void main(String[] args) {
        // 示例数据
        Map<String, Map<String, Double>> ratings = new HashMap<>();
        Map<String, Double> user1Ratings = new HashMap<>();
        user1Ratings.put("item1", 4.5);
        user1Ratings.put("item2", 3.0);
        user1Ratings.put("item3", 5.0);
        ratings.put("User1", user1Ratings);

        Map<String, Double> user2Ratings = new HashMap<>();
        user2Ratings.put("item1", 4.0);
        user2Ratings.put("item2", 2.5);
        user2Ratings.put("item3", 3.5);
        user2Ratings.put("item4", 5.0);
        ratings.put("User2", user2Ratings);

        Map<String, Double> user3Ratings = new HashMap<>();
        user3Ratings.put("item1", 2.5);
        user3Ratings.put("item4", 4.5);
        ratings.put("User3", user3Ratings);

        // 创建协同过滤对象
        UserBasedCollaborativeFiltering filter = new UserBasedCollaborativeFiltering(ratings);

        // 为指定用户推荐物品
        String targetUser = "User3";
        int numRecommendations = 3;
        List<String> recommendations = filter.recommendItems(targetUser, numRecommendations);

        // 输出推荐结果
        System.out.println("Recommendations for " + targetUser + ":");
        for (String item : recommendations) {
            System.out.println(item);
        }
    }
}

