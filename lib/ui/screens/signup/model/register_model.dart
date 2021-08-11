import 'package:lifestyle_hub/ui/screens/signup/model/user.dart';
import 'package:lifestyle_hub/ui/screens/signup/model/wallet.dart';

class RegisterModel {

  User user;
  Wallet wallet;
  String token;

	RegisterModel.fromJsonMap(Map<String, dynamic> map): 
		user = User.fromJsonMap(map["user"]),
		wallet = Wallet.fromJsonMap(map["wallet"]),
		token = map["token"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['user'] = user == null ? null : user.toJson();
		data['wallet'] = wallet == null ? null : wallet.toJson();
		data['token'] = token;
		return data;
	}
}
