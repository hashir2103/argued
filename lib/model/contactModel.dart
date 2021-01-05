class ContactModel {
    ContactModel({
        this.data,
        this.message,
        this.key,
        this.code,
    });

    List<Datum> data;
    String message;
    String key;
    int code;

    factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
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
        this.user,
        this.room,
        this.lastRead,
        this.updatedAt,
        this.createdAt,
        this.lastMessage,
        this.lastMessageMobile,
        this.unreadCount,
    });

    String id;
    User user;
    String room;
    DateTime lastRead;
    DateTime updatedAt;
    DateTime createdAt;
    LastMessage lastMessage;
    DateTime lastMessageMobile;
    int unreadCount;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        user: User.fromJson(json["user"]),
        room: json["room"],
        lastRead: DateTime.parse(json["lastRead"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        lastMessage: LastMessage.fromJson(json["lastMessage"]),
        lastMessageMobile: DateTime.parse(json["lastMessageMobile"]),
        unreadCount: json["unreadCount"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user.toJson(),
        "room": room,
        "lastRead": lastRead.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "lastMessage": lastMessage.toJson(),
        "lastMessageMobile": lastMessageMobile.toIso8601String(),
        "unreadCount": unreadCount,
    };
}

class LastMessage {
    LastMessage({
        this.id,
        this.room,
        this.message,
        this.sentBy,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String id;
    String room;
    String message;
    String sentBy;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
        id: json["_id"],
        room: json["room"],
        message: json["message"],
        sentBy: json["sentBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "room": room,
        "message": message,
        "sentBy": sentBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class User {
    User({
        this.id,
        this.username,
        this.profilePic,
        this.opinions,
        this.videos,
        this.userId,
    });

    String id;
    String username;
    String profilePic;
    dynamic opinions;
    dynamic videos;
    String userId;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        username: json["username"],
        profilePic: json["profilePic"],
        opinions: json["opinions"],
        videos: json["videos"],
        userId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "profilePic": profilePic,
        "opinions": opinions,
        "videos": videos,
        "id": userId,
    };
}
