
class SendMessageModel {
  String? body;
  int? participationId;
  String? type;
  int? conversationId;
  String? updatedAt;
  String? createdAt;
  int? id;
  Sender? sender;
  Conversation? conversation;
  Participation1? participation;

  SendMessageModel({this.body, this.participationId, this.type, this.conversationId, this.updatedAt, this.createdAt, this.id, this.sender, this.conversation, this.participation});

  SendMessageModel.fromJson(Map<String, dynamic> json) {
    if(json["body"] is String)
      this.body = json["body"];
    if(json["participation_id"] is int)
      this.participationId = json["participation_id"];
    if(json["type"] is String)
      this.type = json["type"];
    if(json["conversation_id"] is int)
      this.conversationId = json["conversation_id"];
    if(json["updated_at"] is String)
      this.updatedAt = json["updated_at"];
    if(json["created_at"] is String)
      this.createdAt = json["created_at"];
    if(json["id"] is int)
      this.id = json["id"];
    if(json["sender"] is Map)
      this.sender = json["sender"] == null ? null : Sender.fromJson(json["sender"]);
    if(json["conversation"] is Map)
      this.conversation = json["conversation"] == null ? null : Conversation.fromJson(json["conversation"]);
    if(json["participation"] is Map)
      this.participation = json["participation"] == null ? null : Participation1.fromJson(json["participation"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["body"] = this.body;
    data["participation_id"] = this.participationId;
    data["type"] = this.type;
    data["conversation_id"] = this.conversationId;
    data["updated_at"] = this.updatedAt;
    data["created_at"] = this.createdAt;
    data["id"] = this.id;
    if(this.sender != null)
      data["sender"] = this.sender?.toJson();
    if(this.conversation != null)
      data["conversation"] = this.conversation?.toJson();
    if(this.participation != null)
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

  Participation1({this.id, this.conversationId, this.messageableId, this.messageableType, this.settings, this.createdAt, this.updatedAt, this.messageable});

  Participation1.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int)
      this.id = json["id"];
    if(json["conversation_id"] is int)
      this.conversationId = json["conversation_id"];
    if(json["messageable_id"] is int)
      this.messageableId = json["messageable_id"];
    if(json["messageable_type"] is String)
      this.messageableType = json["messageable_type"];
    if(json["settings"] is String)
      this.settings = json["settings"];
    if(json["created_at"] is String)
      this.createdAt = json["created_at"];
    if(json["updated_at"] is String)
      this.updatedAt = json["updated_at"];
    if(json["messageable"] is Map)
      this.messageable = json["messageable"] == null ? null : Messageable.fromJson(json["messageable"]);
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
    if(this.messageable != null)
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

  Messageable({this.id, this.name, this.email, this.emailVerifiedAt, this.phoneNo, this.state, this.address, this.sex, this.dob, this.status, this.referredBy, this.affiliateId, this.trialEnds, this.isAdmin, this.role, this.createdAt, this.updatedAt, this.participation});

  Messageable.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int)
      this.id = json["id"];
    if(json["name"] is String)
      this.name = json["name"];
    if(json["email"] is String)
      this.email = json["email"];
    if(json["email_verified_at"] is String)
      this.emailVerifiedAt = json["email_verified_at"];
    if(json["phone_no"] is String)
      this.phoneNo = json["phone_no"];
    if(json["state"] is String)
      this.state = json["state"];
    if(json["address"] is String)
      this.address = json["address"];
    if(json["sex"] is String)
      this.sex = json["sex"];
    if(json["dob"] is String)
      this.dob = json["dob"];
    if(json["status"] is String)
      this.status = json["status"];
    if(json["referred_by"] is String)
      this.referredBy = json["referred_by"];
    if(json["affiliate_id"] is Map)
      this.affiliateId = json["affiliate_id"] == null ? null : AffiliateId1.fromJson(json["affiliate_id"]);
    if(json["trial_ends"] is String)
      this.trialEnds = json["trial_ends"];
    if(json["is_admin"] is int)
      this.isAdmin = json["is_admin"];
    if(json["role"] is String)
      this.role = json["role"];
    if(json["created_at"] is String)
      this.createdAt = json["created_at"];
    if(json["updated_at"] is String)
      this.updatedAt = json["updated_at"];
    if(json["participation"] is List)
      this.participation = json["participation"]==null ? null : (json["participation"] as List).map((e)=>Participation2.fromJson(e)).toList();
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
    if(this.affiliateId != null)
      data["affiliate_id"] = this.affiliateId?.toJson();
    data["trial_ends"] = this.trialEnds;
    data["is_admin"] = this.isAdmin;
    data["role"] = this.role;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    if(this.participation != null)
      data["participation"] = this.participation?.map((e)=>e.toJson()).toList();
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

  Participation2({this.id, this.conversationId, this.messageableId, this.messageableType, this.settings, this.createdAt, this.updatedAt});

  Participation2.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int)
      this.id = json["id"];
    if(json["conversation_id"] is int)
      this.conversationId = json["conversation_id"];
    if(json["messageable_id"] is int)
      this.messageableId = json["messageable_id"];
    if(json["messageable_type"] is String)
      this.messageableType = json["messageable_type"];
    if(json["settings"] is String)
      this.settings = json["settings"];
    if(json["created_at"] is String)
      this.createdAt = json["created_at"];
    if(json["updated_at"] is String)
      this.updatedAt = json["updated_at"];
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
    if(json["code"] is String)
      this.code = json["code"];
    if(json["link"] is String)
      this.link = json["link"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["code"] = this.code;
    data["link"] = this.link;
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
  List<Participants>? participants;

  Conversation({this.id, this.private, this.directMessage, this.data, this.createdAt, this.updatedAt, this.participants});

  Conversation.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int)
      this.id = json["id"];
    if(json["private"] is bool)
      this.private = json["private"];
    if(json["direct_message"] is bool)
      this.directMessage = json["direct_message"];
    if(json["data"] is List)
      this.data = json["data"] ?? [];
    if(json["created_at"] is String)
      this.createdAt = json["created_at"];
    if(json["updated_at"] is String)
      this.updatedAt = json["updated_at"];
    if(json["participants"] is List)
      this.participants = json["participants"]==null ? null : (json["participants"] as List).map((e)=>Participants.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["private"] = this.private;
    data["direct_message"] = this.directMessage;
    if(this.data != null)
      data["data"] = this.data;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    if(this.participants != null)
      data["participants"] = this.participants?.map((e)=>e.toJson()).toList();
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

  Participants({this.id, this.conversationId, this.messageableId, this.messageableType, this.settings, this.createdAt, this.updatedAt});

  Participants.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int)
      this.id = json["id"];
    if(json["conversation_id"] is int)
      this.conversationId = json["conversation_id"];
    if(json["messageable_id"] is int)
      this.messageableId = json["messageable_id"];
    if(json["messageable_type"] is String)
      this.messageableType = json["messageable_type"];
    if(json["settings"] is String)
      this.settings = json["settings"];
    if(json["created_at"] is String)
      this.createdAt = json["created_at"];
    if(json["updated_at"] is String)
      this.updatedAt = json["updated_at"];
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

  Sender({this.id, this.name, this.email, this.emailVerifiedAt, this.phoneNo, this.state, this.address, this.sex, this.dob, this.status, this.referredBy, this.affiliateId, this.trialEnds, this.isAdmin, this.role, this.createdAt, this.updatedAt, this.participation});

  Sender.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int)
      this.id = json["id"];
    if(json["name"] is String)
      this.name = json["name"];
    if(json["email"] is String)
      this.email = json["email"];
    if(json["email_verified_at"] is String)
      this.emailVerifiedAt = json["email_verified_at"];
    if(json["phone_no"] is String)
      this.phoneNo = json["phone_no"];
    if(json["state"] is String)
      this.state = json["state"];
    if(json["address"] is String)
      this.address = json["address"];
    if(json["sex"] is String)
      this.sex = json["sex"];
    if(json["dob"] is String)
      this.dob = json["dob"];
    if(json["status"] is String)
      this.status = json["status"];
    if(json["referred_by"] is String)
      this.referredBy = json["referred_by"];
    if(json["affiliate_id"] is Map)
      this.affiliateId = json["affiliate_id"] == null ? null : AffiliateId.fromJson(json["affiliate_id"]);
    if(json["trial_ends"] is String)
      this.trialEnds = json["trial_ends"];
    if(json["is_admin"] is int)
      this.isAdmin = json["is_admin"];
    if(json["role"] is String)
      this.role = json["role"];
    if(json["created_at"] is String)
      this.createdAt = json["created_at"];
    if(json["updated_at"] is String)
      this.updatedAt = json["updated_at"];
    if(json["participation"] is List)
      this.participation = json["participation"]==null ? null : (json["participation"] as List).map((e)=>Participation.fromJson(e)).toList();
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
    if(this.affiliateId != null)
      data["affiliate_id"] = this.affiliateId?.toJson();
    data["trial_ends"] = this.trialEnds;
    data["is_admin"] = this.isAdmin;
    data["role"] = this.role;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    if(this.participation != null)
      data["participation"] = this.participation?.map((e)=>e.toJson()).toList();
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

  Participation({this.id, this.conversationId, this.messageableId, this.messageableType, this.settings, this.createdAt, this.updatedAt});

  Participation.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int)
      this.id = json["id"];
    if(json["conversation_id"] is int)
      this.conversationId = json["conversation_id"];
    if(json["messageable_id"] is int)
      this.messageableId = json["messageable_id"];
    if(json["messageable_type"] is String)
      this.messageableType = json["messageable_type"];
    if(json["settings"] is String)
      this.settings = json["settings"];
    if(json["created_at"] is String)
      this.createdAt = json["created_at"];
    if(json["updated_at"] is String)
      this.updatedAt = json["updated_at"];
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
    if(json["code"] is String)
      this.code = json["code"];
    if(json["link"] is String)
      this.link = json["link"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["code"] = this.code;
    data["link"] = this.link;
    return data;
  }
}