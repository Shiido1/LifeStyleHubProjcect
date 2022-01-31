class FreeSignUpList {
  final List<FreeSignUpModel>? freeSignup;

  FreeSignUpList({
    this.freeSignup,
  });

  factory FreeSignUpList.fromJson(List<dynamic> parsedJson) {
    List<FreeSignUpModel> freeSign = [];

    freeSign = parsedJson.map((i) => FreeSignUpModel.fromJson(i)).toList();
    return new FreeSignUpList(
      freeSignup: freeSign,
    );
  }
}

class FreeSignUpModel {
  String? year;
  String? month;
  int? signups;

  FreeSignUpModel({this.year, this.month, this.signups});

  FreeSignUpModel.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    signups = json['signups'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['month'] = this.month;
    data['signups'] = this.signups;
    return data;
  }
}
