class Cutomer {
  String? sId;
  String? name;
  String? cnic;
  String? image;
  String? address;
  String? email;
  String? phone;
  int? noOfProperty;
  int? noOfSold;
  int? iV;

  Cutomer(
      {this.sId,
        this.name,
        this.cnic,
        this.image,
        this.address,
        this.email,
        this.phone,
        this.noOfProperty,
        this.noOfSold,
        this.iV});

  Cutomer.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    cnic = json['cnic'];
    image = json['image'];
    address = json['address'];
    email = json['email'];
    phone = json['phone'];
    noOfProperty = json['noOfProperty'];
    noOfSold = json['noOfSold'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['cnic'] = this.cnic;
    data['image'] = this.image;
    data['address'] = this.address;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['noOfProperty'] = this.noOfProperty;
    data['noOfSold'] = this.noOfSold;
    data['__v'] = this.iV;
    return data;
  }
}
