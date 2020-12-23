class HotTopicModel {
    HotTopicModel({
        this.id,
        this.audience,
        this.rating,
        this.totalRating,
        this.numberOfRatings,
        this.views,
        this.deleted,
        this.requestEngagement,
        this.topic,
        this.heading,
        this.category,
        this.subCategory,
        this.description,
        this.userPostCover,
        this.stand,
        this.country,
        this.language,
        this.createdBy,
        this.video,
        this.details,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.opinionViews,
        this.viewCount,
    });

    String id;
    String audience;
    int rating;
    int totalRating;
    int numberOfRatings;
    int views;
    bool deleted;
    bool requestEngagement;
    String topic;
    String heading;
    String category;
    String subCategory;
    String description;
    String userPostCover;
    String stand;
    String country;
    String language;
    String createdBy;
    String video;
    Details details;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    List<dynamic> opinionViews;
    int viewCount;

    factory HotTopicModel.fromJson(Map<String, dynamic> json) => HotTopicModel(
        id: json["_id"],
        audience: json["audience"],
        rating: json["rating"],
        totalRating: json["totalRating"],
        numberOfRatings: json["numberOfRatings"],
        views: json["views"],
        deleted: json["deleted"],
        requestEngagement: json["requestEngagement"],
        topic: json["topic"],
        heading: json["heading"],
        category: json["category"],
        subCategory: json["subCategory"],
        description: json["description"],
        userPostCover: json["userPostCover"],
        stand: json["stand"],
        country: json["country"],
        language: json["language"],
        createdBy: json["createdBy"],
        video: json["video"],
        details: Details.fromJson(json["details"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        opinionViews: List<dynamic>.from(json["opinion-views"].map((x) => x)),
        viewCount: json["viewCount"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "audience": audience,
        "rating": rating,
        "totalRating": totalRating,
        "numberOfRatings": numberOfRatings,
        "views": views,
        "deleted": deleted,
        "requestEngagement": requestEngagement,
        "topic": topic,
        "heading": heading,
        "category": category,
        "subCategory": subCategory,
        "description": description,
        "userPostCover": userPostCover,
        "stand": stand,
        "country": country,
        "language": language,
        "createdBy": createdBy,
        "video": video,
        "details": details.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "opinion-views": List<dynamic>.from(opinionViews.map((x) => x)),
        "viewCount": viewCount,
    };
}

class Details {
    Details({
        this.subCategoryName,
        this.categoryName,
        this.countryName,
        this.topicName,
        this.userName,
    });

    String subCategoryName;
    String categoryName;
    String countryName;
    String topicName;
    String userName;

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        subCategoryName: json["subCategoryName"],
        categoryName: json["categoryName"],
        countryName: json["countryName"],
        topicName: json["topicName"],
        userName: json["userName"],
    );

    Map<String, dynamic> toJson() => {
        "subCategoryName": subCategoryName,
        "categoryName": categoryName,
        "countryName": countryName,
        "topicName": topicName,
        "userName": userName,
    };
}
