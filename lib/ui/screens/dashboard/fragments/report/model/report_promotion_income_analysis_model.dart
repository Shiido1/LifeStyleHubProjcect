class ReportPromotionIncomeAnalysisModelList {
  List<ReportPromotionIncomeAnalysisModel>? reportPromotionIncomeAnalysisModel;

  ReportPromotionIncomeAnalysisModelList(
      {this.reportPromotionIncomeAnalysisModel});

  factory ReportPromotionIncomeAnalysisModelList.fromJson(
      List<dynamic> parsedJson) {
    List<ReportPromotionIncomeAnalysisModel> viewContesModelList = [];
    viewContesModelList = parsedJson
        .map((i) => ReportPromotionIncomeAnalysisModel.fromJson(i))
        .toList();

    return ReportPromotionIncomeAnalysisModelList(
        reportPromotionIncomeAnalysisModel: viewContesModelList);
  }
}

class ReportPromotionIncomeAnalysisModel {
  int? year;
  int? month;
  int? amount;

  ReportPromotionIncomeAnalysisModel({this.year, this.month, this.amount});

  ReportPromotionIncomeAnalysisModel.fromJson(Map<String, dynamic> json) {
    if (json["year"] is int) this.year = json["year"];
    if (json["month"] is int) this.month = json["month"];
    if (json["amount"] is int) this.amount = json["amount"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["year"] = this.year;
    data["month"] = this.month;
    data["amount"] = this.amount;
    return data;
  }
}
