class ViewPackagesModelList {
  List<ActivePackages>? activePackages;
  List<ActivePackages>? completedPackages;
  List<ActivePackages>? inactivePackages;

  ViewPackagesModelList(
      {this.activePackages, this.completedPackages, this.inactivePackages});

  ViewPackagesModelList.fromJson(Map<String, dynamic> json) {
    if (json["active_packages"] is List)
      this.activePackages = json["active_packages"] == null
          ? null
          : (json["active_packages"] as List)
              .map((e) => ActivePackages.fromJson(e))
              .toList();

    if (json["completed_packages"] is List)
      this.completedPackages = json["completed_packages"] == null
          ? null
          : (json["completed_packages"] as List)
              .map((e) => ActivePackages.fromJson(e))
              .toList();

    if (json["inactive_packages"] is List)
      this.inactivePackages = json["inactive_packages"] == null
          ? null
          : (json["inactive_packages"] as List)
              .map((e) => ActivePackages.fromJson(e))
              .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.activePackages != null)
      data["active_packages"] =
          this.activePackages?.map((e) => e.toJson()).toList();
    if (this.completedPackages != null)
      data["completed_packages"] =
          this.completedPackages?.map((e) => e.toJson()).toList();
    if (this.inactivePackages != null)
      data["inactive_packages"] =
          this.inactivePackages?.map((e) => e.toJson()).toList();
    return data;
  }
}

class ActivePackages {
  String? name;
  String? type;
  int? downlinesRequired;
  int? downlinesAcquired;

  ActivePackages(
      {this.name, this.type, this.downlinesRequired, this.downlinesAcquired});

  ActivePackages.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) this.name = json["name"];
    if (json["type"] is String) this.type = json["type"];
    if (json["downlines_required"] is int)
      this.downlinesRequired = json["downlines_required"];
    if (json["downlines_acquired"] is int)
      this.downlinesAcquired = json["downlines_acquired"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["type"] = this.type;
    data["downlines_required"] = this.downlinesRequired;
    data["downlines_acquired"] = this.downlinesAcquired;
    return data;
  }
}
