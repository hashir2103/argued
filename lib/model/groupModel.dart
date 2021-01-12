class GroupModel {
    GroupModel({
        this.data,
        this.message,
        this.key,
        this.code,
    });

    List<Datum> data;
    String message;
    String key;
    int code;

    factory GroupModel.fromJson(Map<String, dynamic> json) => GroupModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        key: json["key"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "key": key,
        "code": code,
    };
}

class Datum {
    Datum({
        this.id,
        this.audience,
        this.status,
        this.name,
        this.description,
        this.createdBy,
        this.members,
        this.profilePic,
        this.createdAt,
        this.updatedAt,
        this.categoryName,
        this.subCategoryName,
        this.userName,
        this.countryName,
        this.stateName,
        this.cityName,
        this.isAdmin,
        this.isCreator,
        this.topicRelevance,
        this.numberOfMembers,
        this.geoLocationRelevance,
        this.lastMessage,
        this.lastMessageMobile,
        this.lastRead,
        this.unreadCount,
        this.nominations,
        this.joinRequests,
    });

    String id;
    String audience;
    String status;
    String name;
    String description;
    CreatedBy createdBy;
    List<Member> members;
    String profilePic;
    DateTime createdAt;
    DateTime updatedAt;
    String categoryName;
    String subCategoryName;
    String userName;
    String countryName;
    String stateName;
    String cityName;
    bool isAdmin;
    bool isCreator;
    String topicRelevance;
    int numberOfMembers;
    String geoLocationRelevance;
    dynamic lastMessage;
    dynamic lastMessageMobile;
    String lastRead;
    int unreadCount;
    List<dynamic> nominations;
    List<JoinRequest> joinRequests;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        audience: json["audience"],
        status: json["status"],
        name: json["name"],
        description: json["description"],
        createdBy: CreatedBy.fromJson(json["createdBy"]),
        members: List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
        profilePic: json["profilePic"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        categoryName: json["categoryName"],
        subCategoryName: json["subCategoryName"],
        userName: json["userName"],
        countryName: json["countryName"],
        stateName: json["stateName"],
        cityName: json["cityName"],
        isAdmin: json["isAdmin"],
        isCreator: json["isCreator"],
        topicRelevance: json["topicRelevance"],
        numberOfMembers: json["numberOfMembers"],
        geoLocationRelevance: json["geoLocationRelevance"],
        lastMessage: json["lastMessage"],
        lastMessageMobile: json["lastMessageMobile"],
        lastRead: json["lastRead"],
        unreadCount: json["unreadCount"],
        nominations: List<dynamic>.from(json["nominations"].map((x) => x)),
        joinRequests: List<JoinRequest>.from(json["joinRequests"].map((x) => JoinRequest.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "audience": audience,
        "status": status,
        "name": name,
        "description": description,
        "createdBy": createdBy.toJson(),
        "members": List<dynamic>.from(members.map((x) => x.toJson())),
        "profilePic": profilePic,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "categoryName": categoryName,
        "subCategoryName": subCategoryName,
        "userName": userName,
        "countryName": countryName,
        "stateName": stateName,
        "cityName": cityName,
        "isAdmin": isAdmin,
        "isCreator": isCreator,
        "topicRelevance": topicRelevance,
        "numberOfMembers": numberOfMembers,
        "geoLocationRelevance": geoLocationRelevance,
        "lastMessage": lastMessage,
        "lastMessageMobile": lastMessageMobile,
        "lastRead": lastRead,
        "unreadCount": unreadCount,
        "nominations": List<dynamic>.from(nominations.map((x) => x)),
        "joinRequests": List<dynamic>.from(joinRequests.map((x) => x.toJson())),
    };
}

class CreatedBy {
    CreatedBy({
        this.id,
        this.username,
    });

    String id;
    String username;

    factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["_id"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
    };
}

class JoinRequest {
    JoinRequest({
        this.status,
        this.id,
        this.createdBy,
        this.createdFor,
        this.group,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String status;
    String id;
    String createdBy;
    CreatedFor createdFor;
    Group group;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory JoinRequest.fromJson(Map<String, dynamic> json) => JoinRequest(
        status: json["status"],
        id: json["_id"],
        createdBy: json["createdBy"],
        createdFor: CreatedFor.fromJson(json["createdFor"]),
        group: Group.fromJson(json["group"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "_id": id,
        "createdBy": createdBy,
        "createdFor": createdFor.toJson(),
        "group": group.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class CreatedFor {
    CreatedFor({
        this.id,
        this.username,
        this.opinions,
        this.videos,
        this.createdForId,
    });

    String id;
    String username;
    dynamic opinions;
    dynamic videos;
    String createdForId;

    factory CreatedFor.fromJson(Map<String, dynamic> json) => CreatedFor(
        id: json["_id"],
        username: json["username"],
        opinions: json["opinions"],
        videos: json["videos"],
        createdForId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "opinions": opinions,
        "videos": videos,
        "id": createdForId,
    };
}

class Group {
    Group({
        this.audience,
        this.status,
        this.id,
        this.name,
        this.description,
        this.city,
        this.country,
        this.state,
        this.category,
        this.subcategory,
        this.createdBy,
        this.members,
        this.profilePic,
        this.nominations,
        this.details,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String audience;
    String status;
    String id;
    String name;
    String description;
    String city;
    String country;
    String state;
    String category;
    String subcategory;
    String createdBy;
    List<Member> members;
    String profilePic;
    List<dynamic> nominations;
    Details details;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory Group.fromJson(Map<String, dynamic> json) => Group(
        audience: json["audience"],
        status: json["status"],
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        country: json["country"],
        state: json["state"],
        category: json["category"],
        subcategory: json["subcategory"],
        createdBy: json["createdBy"],
        members: List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
        profilePic: json["profilePic"],
        nominations: List<dynamic>.from(json["nominations"].map((x) => x)),
        details: Details.fromJson(json["details"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "audience": audience,
        "status": status,
        "_id": id,
        "name": name,
        "description": description,
        "city": city,
        "country": country,
        "state": state,
        "category": category,
        "subcategory": subcategory,
        "createdBy": createdBy,
        "members": List<dynamic>.from(members.map((x) => x.toJson())),
        "profilePic": profilePic,
        "nominations": List<dynamic>.from(nominations.map((x) => x)),
        "details": details.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class Details {
    Details({
        this.subCategoryName,
        this.categoryName,
        this.countryName,
        this.stateName,
        this.cityName,
    });

    String subCategoryName;
    String categoryName;
    String countryName;
    String stateName;
    String cityName;

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        subCategoryName: json["subCategoryName"],
        categoryName: json["categoryName"],
        countryName: json["countryName"],
        stateName: json["stateName"],
        cityName: json["cityName"],
    );

    Map<String, dynamic> toJson() => {
        "subCategoryName": subCategoryName,
        "categoryName": categoryName,
        "countryName": countryName,
        "stateName": stateName,
        "cityName": cityName,
    };
}

class Member {
    Member({
        this.admin,
        this.blocked,
        this.id,
        this.adminDate,
        this.createdAt,
        this.updatedAt,
    });

    bool admin;
    bool blocked;
    String id;
    DateTime adminDate;
    DateTime createdAt;
    DateTime updatedAt;

    factory Member.fromJson(Map<String, dynamic> json) => Member(
        admin: json["admin"],
        blocked: json["blocked"],
        id: json["_id"],
        adminDate: DateTime.parse(json["adminDate"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "admin": admin,
        "blocked": blocked,
        "_id": id,
        "adminDate": adminDate.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
