
class User {

  String email;
  String trial_ends;
  String referred_by;
  String affiliate_id;
  String updated_at;
  String created_at;
  int id;

	User.fromJsonMap(Map<String, dynamic> map): 
		email = map["email"],
		trial_ends = map["trial_ends"],
		referred_by = map["referred_by"],
		affiliate_id = map["affiliate_id"],
		updated_at = map["updated_at"],
		created_at = map["created_at"],
		id = map["id"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['email'] = email;
		data['trial_ends'] = trial_ends;
		data['referred_by'] = referred_by;
		data['affiliate_id'] = affiliate_id;
		data['updated_at'] = updated_at;
		data['created_at'] = created_at;
		data['id'] = id;
		return data;
	}
}
