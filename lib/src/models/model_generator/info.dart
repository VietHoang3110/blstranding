class Info {
  List<DataInfo>? data;
  int? code;

  Info({this.data, this.code});

  Info.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataInfo>[];
      json['data'].forEach((v) {
        data!.add(new DataInfo.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class DataInfo {
  String? title;
  String? post;

  DataInfo({this.title, this.post});

  DataInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    post = json['post'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['post'] = this.post;
    return data;
  }
}
