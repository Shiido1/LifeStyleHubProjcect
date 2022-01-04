import '../../../../../helper/configs/instances.dart';

class TempBasicInformationHolder {
  static String? fullName;
  static String? userName;
  static String? phoneNumber;
  static String? state;
  static String? address;
  static String? sex;
  static String? dateOfBirth;

  static String? nxtPhoneNumber;
  static String? nxtRelationship;
  static String? nxtFullName;
  static String? nxtEmail;

  static Map<String, dynamic> sendData({
    required String name,
    required String username,
    required String phoneNumber,
    required String state,
    required String address,
    required String sex,
    required String dob,
    required String nameOfNextOfKin,
    required String relationshipOfNextOfKin,
    required String phoneOfNextOfKin,
    required String emailOfNextOfKin,
  }) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = name;
    data["username"] = username;
    data["phone_no"] = phoneNumber;
    data["state"] = state;
    data["address"] = address;
    data["sex"] = sex;
    data["dob"] = dob;
    data["nok_name"] = nameOfNextOfKin;
    data["nok_relation"] = relationshipOfNextOfKin;
    data["nok_phone_no"] = phoneOfNextOfKin;
    data["nok_email"] = emailOfNextOfKin;
    data["country_id"] = '128';
    return data;
  }
}
