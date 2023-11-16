import 'dart:convert';

class userUpdateModel {
  userUpdate? user;
  String? refreshToken, accessToken;
  List<String>? scope, subscriptions, roles;
  List<dynamic>? centers;

  userUpdateModel({
    this.user,
    this.refreshToken,
    this.accessToken,
    this.scope,
    this.centers,
    this.subscriptions,
    this.roles,
  });

  factory userUpdateModel.fromRawJson(String str) =>
      userUpdateModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory userUpdateModel.fromJson(Map<String, dynamic> json) => userUpdateModel(
        user: json["user"] == null ? null : userUpdate.fromJson(json["user"]),
        refreshToken: json["refreshToken"],
        accessToken: json["accessToken"],
        scope: json["scope"] == null
            ? []
            : List<String>.from(json["scope"]!.map((x) => x)),
        centers: json["centers"] == null
            ? []
            : List<dynamic>.from(json["centers"]!.map((x) => x)),
        subscriptions: json["subscriptions"] == null
            ? []
            : List<String>.from(json["subscriptions"]!.map((x) => x)),
        roles: json["roles"] == null
            ? []
            : List<String>.from(json["roles"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "refreshToken": refreshToken,
        "accessToken": accessToken,
        "scope": scope == null ? [] : List<dynamic>.from(scope!.map((x) => x)),
        "centers":
            centers == null ? [] : List<dynamic>.from(centers!.map((x) => x)),
        "subscriptions": subscriptions == null
            ? []
            : List<dynamic>.from(subscriptions!.map((x) => x)),
        "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x)),
      };
}

class userUpdate {
  bool? isActive,
      isEnabled,
      passwordUpdateRequired,
      pinUpdateRequired,
      phoneNumberVerified,
      isDeleted;
  String? id,
      email,
      firstName,
      lastName,
      password,
      role,
      roleName,
      phoneNumber,
      countryCode,
      pin,
      profileImageUrl,
      otp;
  int? roleRank, v;
  DateTime? createdAt, updatedAt;
  dynamic emailVerified, otpExpiry;

  userUpdate({
    this.isActive,
    this.isEnabled,
    this.phoneNumberVerified,
    this.emailVerified,
    this.passwordUpdateRequired,
    this.pinUpdateRequired,
    this.isDeleted,
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.role,
    this.roleName,
    this.roleRank,
    this.phoneNumber,
    this.countryCode,
    this.pin,
    this.createdAt,
    this.v,
    this.profileImageUrl,
    this.updatedAt,
    this.otp,
    this.otpExpiry,
  });

  factory userUpdate.fromRawJson(String str) => userUpdate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory userUpdate.fromJson(Map<String, dynamic> json) => userUpdate(
        isActive: json["isActive"],
        isEnabled: json["isEnabled"],
        phoneNumberVerified: json["phoneNumberVerified"],
        emailVerified: json["emailVerified"],
        passwordUpdateRequired: json["passwordUpdateRequired"],
        pinUpdateRequired: json["pinUpdateRequired"],
        isDeleted: json["isDeleted"],
        id: json["_id"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        password: json["password"],
        role: json["role"],
        roleName: json["roleName"],
        roleRank: json["roleRank"],
        phoneNumber: json["phoneNumber"],
        countryCode: json["countryCode"],
        pin: json["pin"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        v: json["__v"],
        profileImageUrl: json["profileImageUrl"],
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        otp: json["otp"],
        otpExpiry: json["otpExpiry"],
      );

  Map<String, dynamic> toJson() => {
        "isActive": isActive,
        "isEnabled": isEnabled,
        "phoneNumberVerified": phoneNumberVerified,
        "emailVerified": emailVerified,
        "passwordUpdateRequired": passwordUpdateRequired,
        "pinUpdateRequired": pinUpdateRequired,
        "isDeleted": isDeleted,
        "_id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "password": password,
        "role": role,
        "roleName": roleName,
        "roleRank": roleRank,
        "phoneNumber": phoneNumber,
        "countryCode": countryCode,
        "pin": pin,
        "createdAt": createdAt?.toIso8601String(),
        "__v": v,
        "profileImageUrl": profileImageUrl,
        "updatedAt": updatedAt?.toIso8601String(),
        "otp": otp,
        "otpExpiry": otpExpiry,
      };
}
