class GetLastMessagesModel {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  GetLastMessagesModel(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  GetLastMessagesModel.fromJson(Map<String, dynamic> json) {
    if (json["current_page"] is int) this.currentPage = json["current_page"];
    if (json["data"] is List)
      this.data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    if (json["first_page_url"] is String)
      this.firstPageUrl = json["first_page_url"];
    if (json["from"] is int) this.from = json["from"];
    if (json["last_page"] is int) this.lastPage = json["last_page"];
    if (json["last_page_url"] is String)
      this.lastPageUrl = json["last_page_url"];
    if (json["links"] is List)
      this.links = json["links"] == null
          ? null
          : (json["links"] as List).map((e) => Links.fromJson(e)).toList();
    if (json["next_page_url"] is String)
      this.nextPageUrl = json["next_page_url"];
    if (json["path"] is String) this.path = json["path"];
    if (json["per_page"] is int) this.perPage = json["per_page"];
    if (json["prev_page_url"] is String)
      this.prevPageUrl = json["prev_page_url"];
    if (json["to"] is int) this.to = json["to"];
    if (json["total"] is int) this.total = json["total"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["current_page"] = this.currentPage;
    if (this.data != null)
      data["data"] = this.data?.map((e) => e.toJson()).toList();
    data["first_page_url"] = this.firstPageUrl;
    data["from"] = this.from;
    data["last_page"] = this.lastPage;
    data["last_page_url"] = this.lastPageUrl;
    if (this.links != null)
      data["links"] = this.links?.map((e) => e.toJson()).toList();
    data["next_page_url"] = this.nextPageUrl;
    data["path"] = this.path;
    data["per_page"] = this.perPage;
    data["prev_page_url"] = this.prevPageUrl;
    data["to"] = this.to;
    data["total"] = this.total;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    if (json["url"] is String) this.url = json["url"];
    if (json["label"] is String) this.label = json["label"];
    if (json["active"] is bool) this.active = json["active"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["url"] = this.url;
    data["label"] = this.label;
    data["active"] = this.active;
    return data;
  }
}

class Data {
  int? id;
  int? conversationId;
  int? messageableId;
  String? messageableType;
  String? settings;
  String? createdAt;
  String? updatedAt;
  int? private;
  int? directMessage;
  String? data;
  late Conversation conversation;

  Data(
      {this.id,
      this.conversationId,
      this.messageableId,
      this.messageableType,
      this.settings,
      this.createdAt,
      this.updatedAt,
      this.private,
      this.directMessage,
      this.data,
      required this.conversation});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["conversation_id"] is int)
      this.conversationId = json["conversation_id"];
    if (json["messageable_id"] is int)
      this.messageableId = json["messageable_id"];
    if (json["messageable_type"] is String)
      this.messageableType = json["messageable_type"];
    if (json["settings"] is String) this.settings = json["settings"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["private"] is int) this.private = json["private"];
    if (json["direct_message"] is int)
      this.directMessage = json["direct_message"];
    if (json["data"] is String) this.data = json["data"];
    if (json["conversation"] is Map)
      this.conversation = (json["conversation"] == null
          ? null
          : Conversation.fromJson(json["conversation"]))!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["conversation_id"] = this.conversationId;
    data["messageable_id"] = this.messageableId;
    data["messageable_type"] = this.messageableType;
    data["settings"] = this.settings;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    data["private"] = this.private;
    data["direct_message"] = this.directMessage;
    data["data"] = this.data;
    data["conversation"] = this.conversation.toJson();
    return data;
  }
}

class Conversation {
  int? id;
  bool? private;
  bool? directMessage;
  List<dynamic>? data;
  String? createdAt;
  String? updatedAt;
  LastMessage? lastMessage;
  List<Participants>? participants;

  Conversation(
      {this.id,
      this.private,
      this.directMessage,
      this.data,
      this.createdAt,
      this.updatedAt,
      this.lastMessage,
      this.participants});

  Conversation.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["private"] is bool) this.private = json["private"];
    if (json["direct_message"] is bool)
      this.directMessage = json["direct_message"];
    if (json["data"] is List) this.data = json["data"] ?? [];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["last_message"] is Map)
      this.lastMessage = json["last_message"] == null
          ? null
          : LastMessage.fromJson(json["last_message"]);
    if (json["participants"] is List)
      this.participants = json["participants"] == null
          ? null
          : (json["participants"] as List)
              .map((e) => Participants.fromJson(e))
              .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["private"] = this.private;
    data["direct_message"] = this.directMessage;
    if (this.data != null) data["data"] = this.data;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    if (this.lastMessage != null)
      data["last_message"] = this.lastMessage?.toJson();
    if (this.participants != null)
      data["participants"] = this.participants?.map((e) => e.toJson()).toList();
    return data;
  }
}

class Participants {
  int? id;
  int? conversationId;
  int? messageableId;
  String? messageableType;
  String? settings;
  String? createdAt;
  String? updatedAt;
  Messageable1? messageable;

  Participants(
      {this.id,
      this.conversationId,
      this.messageableId,
      this.messageableType,
      this.settings,
      this.createdAt,
      this.updatedAt,
      this.messageable});

  Participants.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["conversation_id"] is int)
      this.conversationId = json["conversation_id"];
    if (json["messageable_id"] is int)
      this.messageableId = json["messageable_id"];
    if (json["messageable_type"] is String)
      this.messageableType = json["messageable_type"];
    if (json["settings"] is String) this.settings = json["settings"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["messageable"] is Map)
      this.messageable = json["messageable"] == null
          ? null
          : Messageable1.fromJson(json["messageable"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["conversation_id"] = this.conversationId;
    data["messageable_id"] = this.messageableId;
    data["messageable_type"] = this.messageableType;
    data["settings"] = this.settings;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    if (this.messageable != null)
      data["messageable"] = this.messageable?.toJson();
    return data;
  }
}

class Messageable1 {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? phoneNo;
  String? state;
  String? address;
  String? sex;
  String? dob;
  String? status;
  String? referredBy;
  AffiliateId2? affiliateId;
  String? trialEnds;
  int? isAdmin;
  String? role;
  String? createdAt;
  String? updatedAt;
  List<Participation3>? participation;

  Messageable1(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.phoneNo,
      this.state,
      this.address,
      this.sex,
      this.dob,
      this.status,
      this.referredBy,
      this.affiliateId,
      this.trialEnds,
      this.isAdmin,
      this.role,
      this.createdAt,
      this.updatedAt,
      this.participation});

  Messageable1.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["email"] is String) this.email = json["email"];
    if (json["email_verified_at"] is String)
      this.emailVerifiedAt = json["email_verified_at"];
    if (json["phone_no"] is String) this.phoneNo = json["phone_no"];
    if (json["state"] is String) this.state = json["state"];
    if (json["address"] is String) this.address = json["address"];
    if (json["sex"] is String) this.sex = json["sex"];
    if (json["dob"] is String) this.dob = json["dob"];
    if (json["status"] is String) this.status = json["status"];
    if (json["referred_by"] is String) this.referredBy = json["referred_by"];
    if (json["affiliate_id"] is Map)
      this.affiliateId = json["affiliate_id"] == null
          ? null
          : AffiliateId2.fromJson(json["affiliate_id"]);
    if (json["trial_ends"] is String) this.trialEnds = json["trial_ends"];
    if (json["is_admin"] is int) this.isAdmin = json["is_admin"];
    if (json["role"] is String) this.role = json["role"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["participation"] is List)
      this.participation = json["participation"] == null
          ? null
          : (json["participation"] as List)
              .map((e) => Participation3.fromJson(e))
              .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["email"] = this.email;
    data["email_verified_at"] = this.emailVerifiedAt;
    data["phone_no"] = this.phoneNo;
    data["state"] = this.state;
    data["address"] = this.address;
    data["sex"] = this.sex;
    data["dob"] = this.dob;
    data["status"] = this.status;
    data["referred_by"] = this.referredBy;
    if (this.affiliateId != null)
      data["affiliate_id"] = this.affiliateId?.toJson();
    data["trial_ends"] = this.trialEnds;
    data["is_admin"] = this.isAdmin;
    data["role"] = this.role;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    if (this.participation != null)
      data["participation"] =
          this.participation?.map((e) => e.toJson()).toList();
    return data;
  }
}

class Participation3 {
  int? id;
  int? conversationId;
  int? messageableId;
  String? messageableType;
  String? settings;
  String? createdAt;
  String? updatedAt;

  Participation3(
      {this.id,
      this.conversationId,
      this.messageableId,
      this.messageableType,
      this.settings,
      this.createdAt,
      this.updatedAt});

  Participation3.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["conversation_id"] is int)
      this.conversationId = json["conversation_id"];
    if (json["messageable_id"] is int)
      this.messageableId = json["messageable_id"];
    if (json["messageable_type"] is String)
      this.messageableType = json["messageable_type"];
    if (json["settings"] is String) this.settings = json["settings"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["conversation_id"] = this.conversationId;
    data["messageable_id"] = this.messageableId;
    data["messageable_type"] = this.messageableType;
    data["settings"] = this.settings;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}

class AffiliateId2 {
  String? code;
  String? link;

  AffiliateId2({this.code, this.link});

  AffiliateId2.fromJson(Map<String, dynamic> json) {
    if (json["code"] is String) this.code = json["code"];
    if (json["link"] is String) this.link = json["link"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["code"] = this.code;
    data["link"] = this.link;
    return data;
  }
}

class LastMessage {
  int? id;
  int? messageId;
  int? messageableId;
  String? messageableType;
  int? conversationId;
  int? participationId;
  int? isSeen;
  int? isSender;
  bool? flagged;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? body;
  String? type;
  Sender? sender;
  Participation1? participation;

  LastMessage(
      {this.id,
      this.messageId,
      this.messageableId,
      this.messageableType,
      this.conversationId,
      this.participationId,
      this.isSeen,
      this.isSender,
      this.flagged,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.body,
      this.type,
      this.sender,
      this.participation});

  LastMessage.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["message_id"] is int) this.messageId = json["message_id"];
    if (json["messageable_id"] is int)
      this.messageableId = json["messageable_id"];
    if (json["messageable_type"] is String)
      this.messageableType = json["messageable_type"];
    if (json["conversation_id"] is int)
      this.conversationId = json["conversation_id"];
    if (json["participation_id"] is int)
      this.participationId = json["participation_id"];
    if (json["is_seen"] is int) this.isSeen = json["is_seen"];
    if (json["is_sender"] is int) this.isSender = json["is_sender"];
    if (json["flagged"] is bool) this.flagged = json["flagged"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["deleted_at"] is String) this.deletedAt = json["deleted_at"];
    if (json["body"] is String) this.body = json["body"];
    if (json["type"] is String) this.type = json["type"];
    if (json["sender"] is Map)
      this.sender =
          json["sender"] == null ? null : Sender.fromJson(json["sender"]);
    if (json["participation"] is Map)
      this.participation = json["participation"] == null
          ? null
          : Participation1.fromJson(json["participation"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["message_id"] = this.messageId;
    data["messageable_id"] = this.messageableId;
    data["messageable_type"] = this.messageableType;
    data["conversation_id"] = this.conversationId;
    data["participation_id"] = this.participationId;
    data["is_seen"] = this.isSeen;
    data["is_sender"] = this.isSender;
    data["flagged"] = this.flagged;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    data["deleted_at"] = this.deletedAt;
    data["body"] = this.body;
    data["type"] = this.type;
    if (this.sender != null) data["sender"] = this.sender?.toJson();
    if (this.participation != null)
      data["participation"] = this.participation?.toJson();
    return data;
  }
}

class Participation1 {
  int? id;
  int? conversationId;
  int? messageableId;
  String? messageableType;
  String? settings;
  String? createdAt;
  String? updatedAt;
  Messageable? messageable;

  Participation1(
      {this.id,
      this.conversationId,
      this.messageableId,
      this.messageableType,
      this.settings,
      this.createdAt,
      this.updatedAt,
      this.messageable});

  Participation1.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["conversation_id"] is int)
      this.conversationId = json["conversation_id"];
    if (json["messageable_id"] is int)
      this.messageableId = json["messageable_id"];
    if (json["messageable_type"] is String)
      this.messageableType = json["messageable_type"];
    if (json["settings"] is String) this.settings = json["settings"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["messageable"] is Map)
      this.messageable = json["messageable"] == null
          ? null
          : Messageable.fromJson(json["messageable"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["conversation_id"] = this.conversationId;
    data["messageable_id"] = this.messageableId;
    data["messageable_type"] = this.messageableType;
    data["settings"] = this.settings;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    if (this.messageable != null)
      data["messageable"] = this.messageable?.toJson();
    return data;
  }
}

class Messageable {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? phoneNo;
  String? state;
  String? address;
  String? sex;
  String? dob;
  String? status;
  String? referredBy;
  AffiliateId1? affiliateId;
  String? trialEnds;
  int? isAdmin;
  String? role;
  String? createdAt;
  String? updatedAt;
  List<Participation2>? participation;

  Messageable(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.phoneNo,
      this.state,
      this.address,
      this.sex,
      this.dob,
      this.status,
      this.referredBy,
      this.affiliateId,
      this.trialEnds,
      this.isAdmin,
      this.role,
      this.createdAt,
      this.updatedAt,
      this.participation});

  Messageable.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["email"] is String) this.email = json["email"];
    if (json["email_verified_at"] is String)
      this.emailVerifiedAt = json["email_verified_at"];
    if (json["phone_no"] is String) this.phoneNo = json["phone_no"];
    if (json["state"] is String) this.state = json["state"];
    if (json["address"] is String) this.address = json["address"];
    if (json["sex"] is String) this.sex = json["sex"];
    if (json["dob"] is String) this.dob = json["dob"];
    if (json["status"] is String) this.status = json["status"];
    if (json["referred_by"] is String) this.referredBy = json["referred_by"];
    if (json["affiliate_id"] is Map)
      this.affiliateId = json["affiliate_id"] == null
          ? null
          : AffiliateId1.fromJson(json["affiliate_id"]);
    if (json["trial_ends"] is String) this.trialEnds = json["trial_ends"];
    if (json["is_admin"] is int) this.isAdmin = json["is_admin"];
    if (json["role"] is String) this.role = json["role"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["participation"] is List)
      this.participation = json["participation"] == null
          ? null
          : (json["participation"] as List)
              .map((e) => Participation2.fromJson(e))
              .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["email"] = this.email;
    data["email_verified_at"] = this.emailVerifiedAt;
    data["phone_no"] = this.phoneNo;
    data["state"] = this.state;
    data["address"] = this.address;
    data["sex"] = this.sex;
    data["dob"] = this.dob;
    data["status"] = this.status;
    data["referred_by"] = this.referredBy;
    if (this.affiliateId != null)
      data["affiliate_id"] = this.affiliateId?.toJson();
    data["trial_ends"] = this.trialEnds;
    data["is_admin"] = this.isAdmin;
    data["role"] = this.role;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    if (this.participation != null)
      data["participation"] =
          this.participation?.map((e) => e.toJson()).toList();
    return data;
  }
}

class Participation2 {
  int? id;
  int? conversationId;
  int? messageableId;
  String? messageableType;
  String? settings;
  String? createdAt;
  String? updatedAt;

  Participation2(
      {this.id,
      this.conversationId,
      this.messageableId,
      this.messageableType,
      this.settings,
      this.createdAt,
      this.updatedAt});

  Participation2.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["conversation_id"] is int)
      this.conversationId = json["conversation_id"];
    if (json["messageable_id"] is int)
      this.messageableId = json["messageable_id"];
    if (json["messageable_type"] is String)
      this.messageableType = json["messageable_type"];
    if (json["settings"] is String) this.settings = json["settings"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["conversation_id"] = this.conversationId;
    data["messageable_id"] = this.messageableId;
    data["messageable_type"] = this.messageableType;
    data["settings"] = this.settings;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}

class AffiliateId1 {
  String? code;
  String? link;

  AffiliateId1({this.code, this.link});

  AffiliateId1.fromJson(Map<String, dynamic> json) {
    if (json["code"] is String) this.code = json["code"];
    if (json["link"] is String) this.link = json["link"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["code"] = this.code;
    data["link"] = this.link;
    return data;
  }
}

class Sender {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? phoneNo;
  String? state;
  String? address;
  String? sex;
  String? dob;
  String? status;
  String? referredBy;
  AffiliateId? affiliateId;
  String? trialEnds;
  int? isAdmin;
  String? role;
  String? createdAt;
  String? updatedAt;
  List<Participation>? participation;

  Sender(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.phoneNo,
      this.state,
      this.address,
      this.sex,
      this.dob,
      this.status,
      this.referredBy,
      this.affiliateId,
      this.trialEnds,
      this.isAdmin,
      this.role,
      this.createdAt,
      this.updatedAt,
      this.participation});

  Sender.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["email"] is String) this.email = json["email"];
    if (json["email_verified_at"] is String)
      this.emailVerifiedAt = json["email_verified_at"];
    if (json["phone_no"] is String) this.phoneNo = json["phone_no"];
    if (json["state"] is String) this.state = json["state"];
    if (json["address"] is String) this.address = json["address"];
    if (json["sex"] is String) this.sex = json["sex"];
    if (json["dob"] is String) this.dob = json["dob"];
    if (json["status"] is String) this.status = json["status"];
    if (json["referred_by"] is String) this.referredBy = json["referred_by"];
    if (json["affiliate_id"] is Map)
      this.affiliateId = json["affiliate_id"] == null
          ? null
          : AffiliateId.fromJson(json["affiliate_id"]);
    if (json["trial_ends"] is String) this.trialEnds = json["trial_ends"];
    if (json["is_admin"] is int) this.isAdmin = json["is_admin"];
    if (json["role"] is String) this.role = json["role"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["participation"] is List)
      this.participation = json["participation"] == null
          ? null
          : (json["participation"] as List)
              .map((e) => Participation.fromJson(e))
              .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["email"] = this.email;
    data["email_verified_at"] = this.emailVerifiedAt;
    data["phone_no"] = this.phoneNo;
    data["state"] = this.state;
    data["address"] = this.address;
    data["sex"] = this.sex;
    data["dob"] = this.dob;
    data["status"] = this.status;
    data["referred_by"] = this.referredBy;
    if (this.affiliateId != null)
      data["affiliate_id"] = this.affiliateId?.toJson();
    data["trial_ends"] = this.trialEnds;
    data["is_admin"] = this.isAdmin;
    data["role"] = this.role;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    if (this.participation != null)
      data["participation"] =
          this.participation?.map((e) => e.toJson()).toList();
    return data;
  }
}

class Participation {
  int? id;
  int? conversationId;
  int? messageableId;
  String? messageableType;
  String? settings;
  String? createdAt;
  String? updatedAt;

  Participation(
      {this.id,
      this.conversationId,
      this.messageableId,
      this.messageableType,
      this.settings,
      this.createdAt,
      this.updatedAt});

  Participation.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["conversation_id"] is int)
      this.conversationId = json["conversation_id"];
    if (json["messageable_id"] is int)
      this.messageableId = json["messageable_id"];
    if (json["messageable_type"] is String)
      this.messageableType = json["messageable_type"];
    if (json["settings"] is String) this.settings = json["settings"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["conversation_id"] = this.conversationId;
    data["messageable_id"] = this.messageableId;
    data["messageable_type"] = this.messageableType;
    data["settings"] = this.settings;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}

class AffiliateId {
  String? code;
  String? link;

  AffiliateId({this.code, this.link});

  AffiliateId.fromJson(Map<String, dynamic> json) {
    if (json["code"] is String) this.code = json["code"];
    if (json["link"] is String) this.link = json["link"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["code"] = this.code;
    data["link"] = this.link;
    return data;
  }
}
