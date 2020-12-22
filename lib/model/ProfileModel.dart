class Profile {
    Profile({
        this.data,
        this.message,
        this.key,
        this.code,
    });

    Data data;
    String message;
    String key;
    int code;

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        key: json["key"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "key": key,
        "code": code,
    };
}

class Data {
    Data({
        this.geoPreference,
        this.income,
        this.completion,
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
        this.keywordsToWatch,
        this.auto,
        this.id,
        this.username,
        this.gender,
        this.role,
        this.email,
        this.plan,
        this.salutation,
        this.confirmId,
        this.contacts,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.activityMovement,
        this.lastLogin,
        this.token,
        this.profilePic,
        this.supportedCategories,
        this.countryCode,
        this.displayName,
        this.dob,
        this.firstname,
        this.lastname,
        this.nationality,
        this.phoneNumber,
        this.businessWebsite,
        this.countryOfResidence,
        this.currency,
        this.displayLanguage,
        this.maritalStatus,
        this.occupation,
        this.religion,
        this.opinions,
        this.videos,
        this.dataId,
    });

    GeoPreference geoPreference;
    String income;
    Completion completion;
    Settings settings;
    bool verified;
    bool paid;
    bool agreeTerms;
    List<String> languagesSpoken;
    List<String> followers;
    List<String> following;
    List<String> topicOfInterests;
    List<String> subCategories;
    List<String> countriesFollowing;
    List<dynamic> statesFollowing;
    List<String> citiesFollowing;
    int storage;
    List<String> countriesToShow;
    double activityScore;
    bool subscription;
    List<dynamic> keywordsToWatch;
    bool auto;
    String id;
    String username;
    String gender;
    Role role;
    String email;
    String plan;
    String salutation;
    String confirmId;
    List<Contact> contacts;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String activityMovement;
    DateTime lastLogin;
    String token;
    String profilePic;
    List<dynamic> supportedCategories;
    String countryCode;
    String displayName;
    DateTime dob;
    String firstname;
    String lastname;
    String nationality;
    String phoneNumber;
    List<dynamic> businessWebsite;
    String countryOfResidence;
    String currency;
    String displayLanguage;
    String maritalStatus;
    String occupation;
    String religion;
    dynamic opinions;
    dynamic videos;
    String dataId;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        geoPreference: GeoPreference.fromJson(json["geoPreference"]),
        income: json["income"],
        completion: Completion.fromJson(json["completion"]),
        settings: Settings.fromJson(json["settings"]),
        verified: json["verified"],
        paid: json["paid"],
        agreeTerms: json["agreeTerms"],
        languagesSpoken: List<String>.from(json["languagesSpoken"].map((x) => x)),
        followers: List<String>.from(json["followers"].map((x) => x)),
        following: List<String>.from(json["following"].map((x) => x)),
        topicOfInterests: List<String>.from(json["topicOfInterests"].map((x) => x)),
        subCategories: List<String>.from(json["subCategories"].map((x) => x)),
        countriesFollowing: List<String>.from(json["countriesFollowing"].map((x) => x)),
        statesFollowing: List<dynamic>.from(json["statesFollowing"].map((x) => x)),
        citiesFollowing: List<String>.from(json["citiesFollowing"].map((x) => x)),
        storage: json["storage"],
        countriesToShow: List<String>.from(json["countriesToShow"].map((x) => x)),
        activityScore: json["activityScore"].toDouble(),
        subscription: json["subscription"],
        keywordsToWatch: List<dynamic>.from(json["keywordsToWatch"].map((x) => x)),
        auto: json["auto"],
        id: json["_id"],
        username: json["username"],
        gender: json["gender"],
        role: Role.fromJson(json["role"]),
        email: json["email"],
        plan: json["plan"],
        salutation: json["salutation"],
        confirmId: json["confirmId"],
        contacts: List<Contact>.from(json["contacts"].map((x) => Contact.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        activityMovement: json["activityMovement"],
        lastLogin: DateTime.parse(json["lastLogin"]),
        token: json["token"],
        profilePic: json["profilePic"],
        supportedCategories: List<dynamic>.from(json["supportedCategories"].map((x) => x)),
        countryCode: json["countryCode"],
        displayName: json["displayName"],
        dob: DateTime.parse(json["dob"]),
        firstname: json["firstname"],
        lastname: json["lastname"],
        nationality: json["nationality"],
        phoneNumber: json["phoneNumber"],
        businessWebsite: List<dynamic>.from(json["businessWebsite"].map((x) => x)),
        countryOfResidence: json["countryOfResidence"],
        currency: json["currency"],
        displayLanguage: json["displayLanguage"],
        maritalStatus: json["maritalStatus"],
        occupation: json["occupation"],
        religion: json["religion"],
        opinions: json["opinions"],
        videos: json["videos"],
        dataId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "geoPreference": geoPreference.toJson(),
        "income": income,
        "completion": completion.toJson(),
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
        "keywordsToWatch": List<dynamic>.from(keywordsToWatch.map((x) => x)),
        "auto": auto,
        "_id": id,
        "username": username,
        "gender": gender,
        "role": role.toJson(),
        "email": email,
        "plan": plan,
        "salutation": salutation,
        "confirmId": confirmId,
        "contacts": List<dynamic>.from(contacts.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "activityMovement": activityMovement,
        "lastLogin": lastLogin.toIso8601String(),
        "token": token,
        "profilePic": profilePic,
        "supportedCategories": List<dynamic>.from(supportedCategories.map((x) => x)),
        "countryCode": countryCode,
        "displayName": displayName,
        "dob": dob.toIso8601String(),
        "firstname": firstname,
        "lastname": lastname,
        "nationality": nationality,
        "phoneNumber": phoneNumber,
        "businessWebsite": List<dynamic>.from(businessWebsite.map((x) => x)),
        "countryOfResidence": countryOfResidence,
        "currency": currency,
        "displayLanguage": displayLanguage,
        "maritalStatus": maritalStatus,
        "occupation": occupation,
        "religion": religion,
        "opinions": opinions,
        "videos": videos,
        "id": dataId,
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

class Contact {
    Contact({
        this.id,
        this.user,
        this.room,
        this.lastRead,
        this.updatedAt,
        this.createdAt,
    });

    String id;
    String user;
    String room;
    DateTime lastRead;
    DateTime updatedAt;
    DateTime createdAt;

    factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["_id"],
        user: json["user"],
        room: json["room"],
        lastRead: DateTime.parse(json["lastRead"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "room": room,
        "lastRead": lastRead.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
    };
}

class GeoPreference {
    GeoPreference({
        this.country,
        this.state,
        this.city,
    });

    String country;
    String state;
    String city;

    factory GeoPreference.fromJson(Map<String, dynamic> json) => GeoPreference(
        country: json["country"],
        state: json["state"],
        city: json["city"],
    );

    Map<String, dynamic> toJson() => {
        "country": country,
        "state": state,
        "city": city,
    };
}

class Role {
    Role({
        this.modules,
        this.isAdmin,
        this.id,
        this.name,
    });

    List<String> modules;
    bool isAdmin;
    String id;
    String name;

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        modules: List<String>.from(json["modules"].map((x) => x)),
        isAdmin: json["isAdmin"],
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "modules": List<dynamic>.from(modules.map((x) => x)),
        "isAdmin": isAdmin,
        "_id": id,
        "name": name,
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
