class ReadNoti {
  String? data;
  String? message;
  int? code;

  ReadNoti({this.data, this.message, this.code});

  ReadNoti.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}