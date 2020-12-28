
class OpinionModel {
    OpinionModel({
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
        this.stand,
        this.country,
        this.language,
        this.createdBy,
        this.video,
        this.details,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.userRatings,
        this.subcatName,
    });

    String id;
    String audience;
    int rating;
    int totalRating;
    int numberOfRatings;
    int views;
    bool deleted;
    bool requestEngagement;
    Topic topic;
    String heading;
    Category category;
    String subCategory;
    String description;
    String stand;
    Country country;
    String language;
    CreatedBy createdBy;
    WelcomeVideo video;
    Details details;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    List<dynamic> userRatings;
    String subcatName;

    factory OpinionModel.fromJson(Map<String, dynamic> json) => OpinionModel(
        id: json["_id"],
        audience: json["audience"],
        rating: json["rating"],
        totalRating: json["totalRating"],
        numberOfRatings: json["numberOfRatings"],
        views: json["views"],
        deleted: json["deleted"],
        requestEngagement: json["requestEngagement"],
        topic: Topic.fromJson(json["topic"]),
        heading: json["heading"],
        category: Category.fromJson(json["category"]),
        subCategory: json["subCategory"],
        description: json["description"],
        stand: json["stand"],
        country: Country.fromJson(json["country"]),
        language: json["language"],
        createdBy: CreatedBy.fromJson(json["createdBy"]),
        video: WelcomeVideo.fromJson(json["video"]),
        details: Details.fromJson(json["details"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        userRatings: List<dynamic>.from(json["userRatings"].map((x) => x)),
        subcatName: json["subcatName"],
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
        "topic": topic.toJson(),
        "heading": heading,
        "category": category.toJson(),
        "subCategory": subCategory,
        "description": description,
        "stand": stand,
        "country": country.toJson(),
        "language": language,
        "createdBy": createdBy.toJson(),
        "video": video.toJson(),
        "details": details.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "userRatings": List<dynamic>.from(userRatings.map((x) => x)),
        "subcatName": subcatName,
    };
}

class Category {
    Category({
        this.id,
        this.status,
        this.tags,
        this.name,
        this.subcategories,
        this.v,
        this.profilePic,
    });

    String id;
    String status;
    List<dynamic> tags;
    String name;
    List<Subcategory> subcategories;
    int v;
    String profilePic;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        status: json["status"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        name: json["name"],
        subcategories: List<Subcategory>.from(json["subcategories"].map((x) => Subcategory.fromJson(x))),
        v: json["__v"],
        profilePic: json["profilePic"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "status": status,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "name": name,
        "subcategories": List<dynamic>.from(subcategories.map((x) => x.toJson())),
        "__v": v,
        "profilePic": profilePic,
    };
}

class Subcategory {
    Subcategory({
        this.status,
        this.tags,
        this.id,
        this.name,
        this.profilePic,
    });

    String status;
    List<String> tags;
    String id;
    String name;
    String profilePic;

    factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        status: json["status"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        profilePic: json["profilePic"] == null ? null : json["profilePic"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "_id": id,
        "name": name,
        "profilePic": profilePic == null ? null : profilePic,
    };
}

class Country {
    Country({
        this.id,
        this.name,
    });

    String id;
    String name;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };
}

class CreatedBy {
    CreatedBy({
        this.id,
        this.verified,
        this.activityScore,
        this.username,
        this.completion,
        this.displayName,
        this.profilePic,
    });

    String id;
    bool verified;
    double activityScore;
    String username;
    Completion completion;
    String displayName;
    String profilePic;

    factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["_id"],
        verified: json["verified"],
        activityScore: json["activityScore"].toDouble(),
        username: json["username"],
        completion: Completion.fromJson(json["completion"]),
        displayName: json["displayName"] == null ? null : json["displayName"],
        profilePic: json["profilePic"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "verified": verified,
        "activityScore": activityScore,
        "username": username,
        "completion": completion.toJson(),
        "displayName": displayName == null ? null : displayName,
        "profilePic": profilePic,
    };
}

class Completion {
    Completion({
        this.percentage,
        this.title,
    });

    int percentage;
    String title;

    factory Completion.fromJson(Map<String, dynamic> json) => Completion(
        percentage: json["percentage"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "percentage": percentage,
        "title": title,
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
        topicName: json["topicName"] == null ? null : json["topicName"],
        userName: json["userName"],
    );

    Map<String, dynamic> toJson() => {
        "subCategoryName": subCategoryName,
        "categoryName": categoryName,
        "countryName": countryName,
        "topicName": topicName == null ? null : topicName,
        "userName": userName,
    };
}

class Topic {
    Topic({
        this.id,
        this.status,
        this.views,
        this.opinionsCount,
        this.country,
        this.name,
        this.category,
        this.description,
        this.createdBy,
        this.subcategory,
        this.details,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.opinions,
        this.stand,
        this.createdByName,
    });

    String id;
    String status;
    int views;
    int opinionsCount;
    String country;
    String name;
    String category;
    dynamic description;
    PurpleCreatedBy createdBy;
    String subcategory;
    Details details;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    List<Opinion> opinions;
    List<Stand> stand;
    CreatedBy createdByName;

    factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json["_id"],
        status: json["status"],
        views: json["views"],
        opinionsCount: json["opinionsCount"],
        country: json["country"],
        name: json["name"],
        category: json["category"],
        description: json["description"],
        createdBy: PurpleCreatedBy.fromJson(json["createdBy"]),
        subcategory: json["subcategory"],
        details: Details.fromJson(json["details"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        opinions: List<Opinion>.from(json["opinions"].map((x) => Opinion.fromJson(x))),
        stand: List<Stand>.from(json["stand"].map((x) => Stand.fromJson(x))),
        createdByName: CreatedBy.fromJson(json["createdByName"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "status": status,
        "views": views,
        "opinionsCount": opinionsCount,
        "country": country,
        "name": name,
        "category": category,
        "description": description,
        "createdBy": createdBy.toJson(),
        "subcategory": subcategory,
        "details": details.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "opinions": List<dynamic>.from(opinions.map((x) => x.toJson())),
        "stand": List<dynamic>.from(stand.map((x) => x.toJson())),
        "createdByName": createdByName.toJson(),
    };
}

class PurpleCreatedBy {
    PurpleCreatedBy({
        this.id,
        this.settings,
        this.verified,
        this.paid,
        this.agreeTerms,
        this.languagesSpoken,
        this.followers,
        this.following,
        this.topicOfInterests,
        this.subCategories,
        this.countriesFollowing,
        this.statesFollowing,
        this.citiesFollowing,
        this.storage,
        this.countriesToShow,
        this.activityScore,
        this.subscription,
        this.username,
        this.email,
        this.confirmId,
        this.role,
        this.plan,
        this.countryOfOrigin,
        this.contacts,
        this.supportedCategories,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.completion,
        this.displayName,
        this.geoPreference,
        this.income,
        this.profilePic,
        this.activityMovement,
        this.lastLogin,
    });

    String id;
    Settings settings;
    bool verified;
    bool paid;
    bool agreeTerms;
    List<dynamic> languagesSpoken;
    List<dynamic> followers;
    List<dynamic> following;
    List<dynamic> topicOfInterests;
    List<String> subCategories;
    List<dynamic> countriesFollowing;
    List<dynamic> statesFollowing;
    List<dynamic> citiesFollowing;
    int storage;
    List<dynamic> countriesToShow;
    double activityScore;
    bool subscription;
    String username;
    String email;
    String confirmId;
    String role;
    String plan;
    String countryOfOrigin;
    List<dynamic> contacts;
    List<dynamic> supportedCategories;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    Completion completion;
    String displayName;
    GeoPreference geoPreference;
    dynamic income;
    String profilePic;
    String activityMovement;
    DateTime lastLogin;

    factory PurpleCreatedBy.fromJson(Map<String, dynamic> json) => PurpleCreatedBy(
        id: json["_id"],
        settings: Settings.fromJson(json["settings"]),
        verified: json["verified"],
        paid: json["paid"],
        agreeTerms: json["agreeTerms"],
        languagesSpoken: List<dynamic>.from(json["languagesSpoken"].map((x) => x)),
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
        following: List<dynamic>.from(json["following"].map((x) => x)),
        topicOfInterests: List<dynamic>.from(json["topicOfInterests"].map((x) => x)),
        subCategories: List<String>.from(json["subCategories"].map((x) => x)),
        countriesFollowing: List<dynamic>.from(json["countriesFollowing"].map((x) => x)),
        statesFollowing: List<dynamic>.from(json["statesFollowing"].map((x) => x)),
        citiesFollowing: List<dynamic>.from(json["citiesFollowing"].map((x) => x)),
        storage: json["storage"],
        countriesToShow: List<dynamic>.from(json["countriesToShow"].map((x) => x)),
        activityScore: json["activityScore"].toDouble(),
        subscription: json["subscription"],
        username: json["username"],
        email: json["email"],
        confirmId: json["confirmId"],
        role: json["role"],
        plan: json["plan"],
        countryOfOrigin: json["countryOfOrigin"],
        contacts: List<dynamic>.from(json["contacts"].map((x) => x)),
        supportedCategories: List<dynamic>.from(json["supportedCategories"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        completion: Completion.fromJson(json["completion"]),
        displayName: json["displayName"],
        geoPreference: GeoPreference.fromJson(json["geoPreference"]),
        income: json["income"],
        profilePic: json["profilePic"],
        activityMovement: json["activityMovement"],
        lastLogin: DateTime.parse(json["lastLogin"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "settings": settings.toJson(),
        "verified": verified,
        "paid": paid,
        "agreeTerms": agreeTerms,
        "languagesSpoken": List<dynamic>.from(languagesSpoken.map((x) => x)),
        "followers": List<dynamic>.from(followers.map((x) => x)),
        "following": List<dynamic>.from(following.map((x) => x)),
        "topicOfInterests": List<dynamic>.from(topicOfInterests.map((x) => x)),
        "subCategories": List<dynamic>.from(subCategories.map((x) => x)),
        "countriesFollowing": List<dynamic>.from(countriesFollowing.map((x) => x)),
        "statesFollowing": List<dynamic>.from(statesFollowing.map((x) => x)),
        "citiesFollowing": List<dynamic>.from(citiesFollowing.map((x) => x)),
        "storage": storage,
        "countriesToShow": List<dynamic>.from(countriesToShow.map((x) => x)),
        "activityScore": activityScore,
        "subscription": subscription,
        "username": username,
        "email": email,
        "confirmId": confirmId,
        "role": role,
        "plan": plan,
        "countryOfOrigin": countryOfOrigin,
        "contacts": List<dynamic>.from(contacts.map((x) => x)),
        "supportedCategories": List<dynamic>.from(supportedCategories.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "completion": completion.toJson(),
        "displayName": displayName,
        "geoPreference": geoPreference.toJson(),
        "income": income,
        "profilePic": profilePic,
        "activityMovement": activityMovement,
        "lastLogin": lastLogin.toIso8601String(),
    };
}

class GeoPreference {
    GeoPreference();

    factory GeoPreference.fromJson(Map<String, dynamic> json) => GeoPreference(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Settings {
    Settings({
        this.showOccupation,
        this.useLocation,
    });

    bool showOccupation;
    bool useLocation;

    factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        showOccupation: json["showOccupation"],
        useLocation: json["useLocation"],
    );

    Map<String, dynamic> toJson() => {
        "showOccupation": showOccupation,
        "useLocation": useLocation,
    };
}

class Opinion {
    Opinion({
        this.id,
        this.heading,
        this.createdBy,
        this.topic,
        this.video,
    });

    String id;
    String heading;
    OpinionCreatedBy createdBy;
    String topic;
    OpinionVideo video;

    factory Opinion.fromJson(Map<String, dynamic> json) => Opinion(
        id: json["_id"],
        heading: json["heading"],
        createdBy: OpinionCreatedBy.fromJson(json["createdBy"]),
        topic: json["topic"],
        video: OpinionVideo.fromJson(json["video"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "heading": heading,
        "createdBy": createdBy.toJson(),
        "topic": topic,
        "video": video.toJson(),
    };
}

class OpinionCreatedBy {
    OpinionCreatedBy({
        this.id,
        this.profilePic,
    });

    String id;
    String profilePic;

    factory OpinionCreatedBy.fromJson(Map<String, dynamic> json) => OpinionCreatedBy(
        id: json["_id"],
        profilePic: json["profilePic"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "profilePic": profilePic,
    };
}

class OpinionVideo {
    OpinionVideo({
        this.id,
        this.thumbnail,
    });

    String id;
    String thumbnail;

    factory OpinionVideo.fromJson(Map<String, dynamic> json) => OpinionVideo(
        id: json["_id"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "thumbnail": thumbnail,
    };
}

class Stand {
    Stand({
        this.id,
        this.user,
        this.topic,
        this.stand,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String id;
    String user;
    String topic;
    String stand;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory Stand.fromJson(Map<String, dynamic> json) => Stand(
        id: json["_id"],
        user: json["user"],
        topic: json["topic"],
        stand: json["stand"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "topic": topic,
        "stand": stand,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class WelcomeVideo {
    WelcomeVideo({
        this.id,
        this.used,
        this.deleted,
        this.uploading,
        this.createdBy,
        this.name,
        this.size,
        this.file,
        this.mimetype,
        this.thumbnail,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.duration,
    });

    String id;
    bool used;
    bool deleted;
    bool uploading;
    String createdBy;
    String name;
    int size;
    String file;
    String mimetype;
    String thumbnail;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    int duration;

    factory WelcomeVideo.fromJson(Map<String, dynamic> json) => WelcomeVideo(
        id: json["_id"],
        used: json["used"],
        deleted: json["deleted"],
        uploading: json["uploading"],
        createdBy: json["createdBy"],
        name: json["name"],
        size: json["size"],
        file: json["file"],
        mimetype: json["mimetype"],
        thumbnail: json["thumbnail"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        duration: json["duration"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "used": used,
        "deleted": deleted,
        "uploading": uploading,
        "createdBy": createdBy,
        "name": name,
        "size": size,
        "file": file,
        "mimetype": mimetype,
        "thumbnail": thumbnail,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "duration": duration,
    };
}
