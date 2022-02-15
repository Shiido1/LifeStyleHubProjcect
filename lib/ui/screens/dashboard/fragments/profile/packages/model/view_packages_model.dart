class ViewPackagesModelList {
  List<ActivePackages>? activePackages;
  List<Null>? completedPackages;
  List<InactivePackages>? inactivePackages;

  ViewPackagesModelList(
      {this.activePackages, this.completedPackages, this.inactivePackages});

  ViewPackagesModelList.fromJson(Map<String, dynamic> json) {
    if (json['active_packages'] != null) {
      activePackages = <ActivePackages>[];
      json['active_packages'].forEach((v) {
        activePackages!.add(new ActivePackages.fromJson(v));
      });
    }
    if (json['completed_packages'] != null) {
      completedPackages = <Null>[];
      json['completed_packages'].forEach((v) {
        completedPackages!.add((v));
      });
    }
    if (json['inactive_packages'] != null) {
      inactivePackages = <InactivePackages>[];
      json['inactive_packages'].forEach((v) {
        inactivePackages!.add(new InactivePackages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.activePackages != null) {
      data['active_packages'] =
          this.activePackages!.map((v) => v.toJson()).toList();
    }
    if (this.completedPackages != null) {
      data['completed_packages'] =
          this.completedPackages!.map((v) => v).toList();
    }
    if (this.inactivePackages != null) {
      data['inactive_packages'] =
          this.inactivePackages!.map((v) => v.toJson()).toList();
    }
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
    name = json['name'];
    type = json['type'];
    downlinesRequired = json['downlines_required'];
    downlinesAcquired = json['downlines_acquired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['downlines_required'] = this.downlinesRequired;
    data['downlines_acquired'] = this.downlinesAcquired;
    return data;
  }
}

class InactivePackages {
  String? name;
  String? type;
  int? downlinesRequired;
  int? downlinesAcquired;

  InactivePackages(
      {this.name, this.type, this.downlinesRequired, this.downlinesAcquired});

  InactivePackages.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    downlinesRequired = json['downlines_required'];
    downlinesAcquired = json['downlines_acquired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['downlines_required'] = this.downlinesRequired;
    data['downlines_acquired'] = this.downlinesAcquired;
    return data;
  }
}
