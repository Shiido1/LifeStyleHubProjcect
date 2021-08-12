class TempWorkAndBankInformationHolder {
  static String? occupation;
  static String? industry;
  static String? officialAddress;
  static String? nameOfAccount;
  static String? accountNumber;
  static String? nameOfBank;
  static String? sortCode;
  static String? swiftCode;

  static Map<String, dynamic> sendData(
      {required String occupation,
      required String industry,
      required String address,
      required String bankName,
      required String accountName,
      required String accountNumber,
      required String sortCode,
      required String swiftCode}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["occupation"] = occupation;
    data["industry"] = industry;
    data["address"] = address;
    data["bank_name"] = bankName;
    data["account_name"] = accountName;
    data["account_no"] = accountNumber;
    data["sort_code"] = sortCode;
    data["swift_code"] = swiftCode;
    return data;
  }
}
