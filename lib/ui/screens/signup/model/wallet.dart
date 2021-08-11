
class Wallet {

  int id;
  int user_id;
  int total_income;
  int total_credit;
  int total_debit;
  int balance;
  String created_at;
  String updated_at;

	Wallet.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		user_id = map["user_id"],
		total_income = map["total_income"],
		total_credit = map["total_credit"],
		total_debit = map["total_debit"],
		balance = map["balance"],
		created_at = map["created_at"],
		updated_at = map["updated_at"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['user_id'] = user_id;
		data['total_income'] = total_income;
		data['total_credit'] = total_credit;
		data['total_debit'] = total_debit;
		data['balance'] = balance;
		data['created_at'] = created_at;
		data['updated_at'] = updated_at;
		return data;
	}
}
