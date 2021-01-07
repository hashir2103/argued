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
        this.createdAt,
        this.updatedAt,
        this.categoryName,
        this.subCategoryName,
        this.userName,
        this.countryName,
        this.isAdmin,
        this.isCreator,
        this.lastRead,
        this.topicRelevance,
        this.numberOfMembers,
        this.geoLocationRelevance,
        this.stateName,
        this.cityName,
        this.lastMessage,
        this.lastMessageMobile,
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
    DateTime createdAt;
    DateTime updatedAt;
    String categoryName;
    String subCategoryName;
    String userName;
    String countryName;
    bool isAdmin;
    bool isCreator;
    DateTime lastRead;
    String topicRelevance;
    int numberOfMembers;
    String geoLocationRelevance;
    dynamic stateName;
    dynamic cityName;
    LastMessage lastMessage;
    DateTime lastMessageMobile;
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
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        categoryName: json["categoryName"],
        subCategoryName: json["subCategoryName"],
        userName: json["userName"],
        countryName: json["countryName"],
        isAdmin: json["isAdmin"],
        isCreator: json["isCreator"],
        lastRead: DateTime.parse(json["lastRead"]),
        topicRelevance: json["topicRelevance"],
        numberOfMembers: json["numberOfMembers"],
        geoLocationRelevance: json["geoLocationRelevance"],
        stateName: json["stateName"],
        cityName: json["cityName"],
        lastMessage: LastMessage.fromJson(json["lastMessage"]),
        lastMessageMobile: DateTime.parse(json["lastMessageMobile"]),
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
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "categoryName": categoryName,
        "subCategoryName": subCategoryName,
        "userName": userName,
        "countryName": countryName,
        "isAdmin": isAdmin,
        "isCreator": isCreator,
        "lastRead": lastRead.toIso8601String(),
        "topicRelevance": topicRelevance,
        "numberOfMembers": numberOfMembers,
        "geoLocationRelevance": geoLocationRelevance,
        "stateName": stateName,
        "cityName": cityName,
        "lastMessage": lastMessage.toJson(),
        "lastMessageMobile": lastMessageMobile.toIso8601String(),
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
        this.country,
        this.category,
        this.topic,
        this.subcategory,
        this.createdBy,
        this.members,
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
    String country;
    String category;
    String topic;
    String subcategory;
    String createdBy;
    List<Member> members;
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
        country: json["country"],
        category: json["category"],
        topic: json["topic"],
        subcategory: json["subcategory"],
        createdBy: json["createdBy"],
        members: List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
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
        "country": country,
        "category": category,
        "topic": topic,
        "subcategory": subcategory,
        "createdBy": createdBy,
        "members": List<dynamic>.from(members.map((x) => x.toJson())),
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
    });

    String subCategoryName;
    String categoryName;
    String countryName;

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        subCategoryName: json["subCategoryName"],
        categoryName: json["categoryName"],
        countryName: json["countryName"],
    );

    Map<String, dynamic> toJson() => {
        "subCategoryName": subCategoryName,
        "categoryName": categoryName,
        "countryName": countryName,
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
        this.lastRead,
    });

    bool admin;
    bool blocked;
    String id;
    DateTime adminDate;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime lastRead;

    factory Member.fromJson(Map<String, dynamic> json) => Member(
        admin: json["admin"],
        blocked: json["blocked"],
        id: json["_id"],
        adminDate: json["adminDate"] == null ? null : DateTime.parse(json["adminDate"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        lastRead: DateTime.parse(json["lastRead"]),
    );

    Map<String, dynamic> toJson() => {
        "admin": admin,
        "blocked": blocked,
        "_id": id,
        "adminDate": adminDate == null ? null : adminDate.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "lastRead": lastRead.toIso8601String(),
    };
}

class LastMessage {
    LastMessage({
        this.id,
        this.group,
        this.message,
        this.sentBy,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String id;
    String group;
    String message;
    String sentBy;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
        id: json["_id"]??"",
        group: json["group"],
        message: json["message"],
        sentBy: json["sentBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "group": group,
        "message": message,
        "sentBy": sentBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
