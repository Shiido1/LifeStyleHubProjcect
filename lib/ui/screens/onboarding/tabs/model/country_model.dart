class CountryModelList {
  final List<CountryModel>? country;

  CountryModelList({
    this.country,
  });

  factory CountryModelList.fromJson(List<dynamic> parsedJson) {
    List<CountryModel> countryModel = [];

    countryModel = parsedJson.map((i) => CountryModel.fromJson(i)).toList();
    return new CountryModelList(
      country: countryModel,
    );
  }
}

class CountryModel {
  int? id;
  String? name;
  String? dialCode;
  String? code;
  String? createdAt;
  String? updatedAt;

  CountryModel(
      {this.id,
      this.name,
      this.dialCode,
      this.code,
      this.createdAt,
      this.updatedAt});

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dialCode = json['dial_code'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['dial_code'] = this.dialCode;
    data['code'] = this.code;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
