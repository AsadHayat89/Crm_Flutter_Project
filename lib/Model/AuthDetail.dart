class Auth {
  String? fullName;
  String? userName;
  String? email;
  String? password;
  String? type;
  String? sId;
  int? iV;

  Auth(
      {this.fullName,
        this.userName,
        this.email,
        this.password,
        this.type,
        this.sId,
        this.iV});

  Auth.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
    type = json['type'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['type'] = this.type;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
