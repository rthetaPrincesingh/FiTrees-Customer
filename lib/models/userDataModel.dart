import 'dart:convert';

class userDataModel {
  String? firstName;
  String? lastName;
  String? email;
  String? app;
  String? title;
  String? education;
  String? location;
  String? bio;
  String? profileImageUrl;
  String? bodyType;
  String? goal;
  String? activityLevel;
  DateTime? dob;
  int? weight;
  int? height;
  bool? isActive;
  bool? isEnabled;
  String? countryCode;
  String? phoneNumber;
  bool? phoneNumberVerified;
  DateTime? emailVerified;
  String? facebookId;
  String? googleId;
  String? githubId;
  bool? passwordUpdateRequired;
  bool? pinUpdateRequired;
  String? id;
  String? roleName;
  int? roleRank;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  bool? isDeleted;
  Scope? scope;
  CreatedBy? role;
  List<Group>? groups;
  List<Permission>? permissions;
  List<CreatedBy>? connections;
  List<Conversation>? conversations;
  List<CreatedBy>? documents;
  List<SharedDocument>? sharedDocuments;
  List<CreatedBy>? images;
  List<CreatedBy>? notifications;
  List<CreatedBy>? companies;
  CreatedBy? createdBy;

  userDataModel({
    this.firstName,
    this.lastName,
    this.email,
    this.app,
    this.title,
    this.education,
    this.location,
    this.bio,
    this.profileImageUrl,
    this.bodyType,
    this.goal,
    this.activityLevel,
    this.dob,
    this.weight,
    this.height,
    this.isActive,
    this.isEnabled,
    this.countryCode,
    this.phoneNumber,
    this.phoneNumberVerified,
    this.emailVerified,
    this.facebookId,
    this.googleId,
    this.githubId,
    this.passwordUpdateRequired,
    this.pinUpdateRequired,
    this.id,
    this.roleName,
    this.roleRank,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.isDeleted,
    this.scope,
    this.role,
    this.groups,
    this.permissions,
    this.connections,
    this.conversations,
    this.documents,
    this.sharedDocuments,
    this.images,
    this.notifications,
    this.companies,
    this.createdBy,
  });

  factory userDataModel.fromJson(String str) => userDataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory userDataModel.fromMap(Map<String, dynamic> json) => userDataModel(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    app: json["app"],
    title: json["title"],
    education: json["education"],
    location: json["location"],
    bio: json["bio"],
    profileImageUrl: json["profileImageUrl"],
    bodyType: json["bodyType"],
    goal: json["goal"],
    activityLevel: json["activityLevel"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    weight: json["weight"],
    height: json["height"],
    isActive: json["isActive"],
    isEnabled: json["isEnabled"],
    countryCode: json["countryCode"],
    phoneNumber: json["phoneNumber"],
    phoneNumberVerified: json["phoneNumberVerified"],
    emailVerified: json["emailVerified"] == null ? null : DateTime.parse(json["emailVerified"]),
    facebookId: json["facebookId"],
    googleId: json["googleId"],
    githubId: json["githubId"],
    passwordUpdateRequired: json["passwordUpdateRequired"],
    pinUpdateRequired: json["pinUpdateRequired"],
    id: json["_id"],
    roleName: json["roleName"],
    roleRank: json["roleRank"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"] == null ? null : DateTime.parse(json["deletedAt"]),
    isDeleted: json["isDeleted"],
    scope: json["scope"] == null ? null : Scope.fromMap(json["scope"]),
    // role: json["role"] == null ? null : CreatedBy.fromMap(json["role"]),
    groups: json["groups"] == null ? [] : List<Group>.from(json["groups"]!.map((x) => Group.fromMap(x))),
    permissions: json["permissions"] == null ? [] : List<Permission>.from(json["permissions"]!.map((x) => Permission.fromMap(x))),
    connections: json["connections"] == null ? [] : List<CreatedBy>.from(json["connections"]!.map((x) => CreatedBy.fromMap(x))),
    conversations: json["conversations"] == null ? [] : List<Conversation>.from(json["conversations"]!.map((x) => Conversation.fromMap(x))),
    documents: json["documents"] == null ? [] : List<CreatedBy>.from(json["documents"]!.map((x) => CreatedBy.fromMap(x))),
    sharedDocuments: json["sharedDocuments"] == null ? [] : List<SharedDocument>.from(json["sharedDocuments"]!.map((x) => SharedDocument.fromMap(x))),
    images: json["images"] == null ? [] : List<CreatedBy>.from(json["images"]!.map((x) => CreatedBy.fromMap(x))),
    notifications: json["notifications"] == null ? [] : List<CreatedBy>.from(json["notifications"]!.map((x) => CreatedBy.fromMap(x))),
    companies: json["companies"] == null ? [] : List<CreatedBy>.from(json["companies"]!.map((x) => CreatedBy.fromMap(x))),
    createdBy: json["createdBy"] == null ? null : CreatedBy.fromMap(json["createdBy"]),
  );

  Map<String, dynamic> toMap() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "app": app,
    "title": title,
    "education": education,
    "location": location,
    "bio": bio,
    "profileImageUrl": profileImageUrl,
    "bodyType": bodyType,
    "goal": goal,
    "activityLevel": activityLevel,
    "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
    "weight": weight,
    "height": height,
    "isActive": isActive,
    "isEnabled": isEnabled,
    "countryCode": countryCode,
    "phoneNumber": phoneNumber,
    "phoneNumberVerified": phoneNumberVerified,
    "emailVerified": "${emailVerified!.year.toString().padLeft(4, '0')}-${emailVerified!.month.toString().padLeft(2, '0')}-${emailVerified!.day.toString().padLeft(2, '0')}",
    "facebookId": facebookId,
    "googleId": googleId,
    "githubId": githubId,
    "passwordUpdateRequired": passwordUpdateRequired,
    "pinUpdateRequired": pinUpdateRequired,
    "_id": id,
    "roleName": roleName,
    "roleRank": roleRank,
    "createdAt": "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
    "updatedAt": "${updatedAt!.year.toString().padLeft(4, '0')}-${updatedAt!.month.toString().padLeft(2, '0')}-${updatedAt!.day.toString().padLeft(2, '0')}",
    "deletedAt": "${deletedAt!.year.toString().padLeft(4, '0')}-${deletedAt!.month.toString().padLeft(2, '0')}-${deletedAt!.day.toString().padLeft(2, '0')}",
    "isDeleted": isDeleted,
    "scope": scope?.toMap(),
    "role": role?.toMap(),
    "groups": groups == null ? [] : List<dynamic>.from(groups!.map((x) => x.toMap())),
    "permissions": permissions == null ? [] : List<dynamic>.from(permissions!.map((x) => x.toMap())),
    "connections": connections == null ? [] : List<dynamic>.from(connections!.map((x) => x.toMap())),
    "conversations": conversations == null ? [] : List<dynamic>.from(conversations!.map((x) => x.toMap())),
    "documents": documents == null ? [] : List<dynamic>.from(documents!.map((x) => x.toMap())),
    "sharedDocuments": sharedDocuments == null ? [] : List<dynamic>.from(sharedDocuments!.map((x) => x.toMap())),
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toMap())),
    "notifications": notifications == null ? [] : List<dynamic>.from(notifications!.map((x) => x.toMap())),
    "companies": companies == null ? [] : List<dynamic>.from(companies!.map((x) => x.toMap())),
    "createdBy": createdBy?.toMap(),
  };
}

class CreatedBy {
  CreatedBy();

  factory CreatedBy.fromJson(String str) => CreatedBy.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreatedBy.fromMap(Map<String, dynamic> json) => CreatedBy(
  );

  Map<String, dynamic> toMap() => {
  };
}

class Conversation {
  bool? hasRead;
  String? user;
  CreatedBy? conversation;
  String? id;

  Conversation({
    this.hasRead,
    this.user,
    this.conversation,
    this.id,
  });

  factory Conversation.fromJson(String str) => Conversation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Conversation.fromMap(Map<String, dynamic> json) => Conversation(
    hasRead: json["hasRead"],
    user: json["user"],
    conversation: json["conversation"] == null ? null : CreatedBy.fromMap(json["conversation"]),
    id: json["_id"],
  );

  Map<String, dynamic> toMap() => {
    "hasRead": hasRead,
    "user": user,
    "conversation": conversation?.toMap(),
    "_id": id,
  };
}

class Group {
  CreatedBy? group;
  String? id;

  Group({
    this.group,
    this.id,
  });

  factory Group.fromJson(String str) => Group.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Group.fromMap(Map<String, dynamic> json) => Group(
    group: json["group"] == null ? null : CreatedBy.fromMap(json["group"]),
    id: json["_id"],
  );

  Map<String, dynamic> toMap() => {
    "group": group?.toMap(),
    "_id": id,
  };
}

class Permission {
  String? state;
  String? user;
  CreatedBy? permission;
  String? id;

  Permission({
    this.state,
    this.user,
    this.permission,
    this.id,
  });

  factory Permission.fromJson(String str) => Permission.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Permission.fromMap(Map<String, dynamic> json) => Permission(
    state: json["state"],
    user: json["user"],
    permission: json["permission"] == null ? null : CreatedBy.fromMap(json["permission"]),
    id: json["_id"],
  );

  Map<String, dynamic> toMap() => {
    "state": state,
    "user": user,
    "permission": permission?.toMap(),
    "_id": id,
  };
}

class Scope {
  List<String>? rootScope;
  List<String>? readScope;
  List<String>? updateScope;
  List<String>? deleteScope;
  List<String>? associateScope;

  Scope({
    this.rootScope,
    this.readScope,
    this.updateScope,
    this.deleteScope,
    this.associateScope,
  });

  factory Scope.fromJson(String str) => Scope.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Scope.fromMap(Map<String, dynamic> json) => Scope(
    rootScope: json["rootScope"] == null ? [] : List<String>.from(json["rootScope"]!.map((x) => x)),
    readScope: json["readScope"] == null ? [] : List<String>.from(json["readScope"]!.map((x) => x)),
    updateScope: json["updateScope"] == null ? [] : List<String>.from(json["updateScope"]!.map((x) => x)),
    deleteScope: json["deleteScope"] == null ? [] : List<String>.from(json["deleteScope"]!.map((x) => x)),
    associateScope: json["associateScope"] == null ? [] : List<String>.from(json["associateScope"]!.map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "rootScope": rootScope == null ? [] : List<dynamic>.from(rootScope!.map((x) => x)),
    "readScope": readScope == null ? [] : List<dynamic>.from(readScope!.map((x) => x)),
    "updateScope": updateScope == null ? [] : List<dynamic>.from(updateScope!.map((x) => x)),
    "deleteScope": deleteScope == null ? [] : List<dynamic>.from(deleteScope!.map((x) => x)),
    "associateScope": associateScope == null ? [] : List<dynamic>.from(associateScope!.map((x) => x)),
  };
}

class SharedDocument {
  bool? canEdit;
  String? user;
  CreatedBy? document;
  String? id;

  SharedDocument({
    this.canEdit,
    this.user,
    this.document,
    this.id,
  });

  factory SharedDocument.fromJson(String str) => SharedDocument.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SharedDocument.fromMap(Map<String, dynamic> json) => SharedDocument(
    canEdit: json["canEdit"],
    user: json["user"],
    document: json["document"] == null ? null : CreatedBy.fromMap(json["document"]),
    id: json["_id"],
  );

  Map<String, dynamic> toMap() => {
    "canEdit": canEdit,
    "user": user,
    "document": document?.toMap(),
    "_id": id,
  };
}