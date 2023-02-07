class Contact {
  List<DataContact>? data;
  int? code;

  Contact({this.data, this.code});

  Contact.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataContact>[];
      json['data'].forEach((v) {
        data!.add(new DataContact.fromJson(v));
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

class DataContact {
  String? id;
  String? name;
  String? phone;
  String? email;
  String? postion;
  String? note;
  String? facebook;
  String? zalo;

  DataContact(
      {this.id,
        this.name,
        this.phone,
        this.email,
        this.postion,
        this.note,
        this.facebook,
        this.zalo});

  DataContact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    postion = json['postion'];
    note = json['note'];
    facebook = json['facebook'];
    zalo = json['zalo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['postion'] = this.postion;
    data['note'] = this.note;
    data['facebook'] = this.facebook;
    data['zalo'] = this.zalo;
    return data;
  }
}
