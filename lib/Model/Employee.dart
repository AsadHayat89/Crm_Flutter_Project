class Employee {
  String? sId;
  String? name;
  String? fatherName;
  String? image;
  int? cnic;
  String? email;
  int? phone;
  String? city;
  String? address;
  int? salary;
  int? commission;
  int? iV;

  Employee(
      {this.sId,
        this.name,
        this.fatherName,
        this.image,
        this.cnic,
        this.email,
        this.phone,
        this.city,
        this.address,
        this.salary,
        this.commission,
        this.iV});

  Employee.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    fatherName = json['fatherName'];
    image = json['image'];
    cnic = json['cnic'];
    email = json['email'];
    phone = json['phone'];
    city = json['city'];
    address = json['address'];
    salary = json['salary'];
    commission = json['commission'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['fatherName'] = this.fatherName;
    data['image'] = this.image;
    data['cnic'] = this.cnic;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['city'] = this.city;
    data['address'] = this.address;
    data['salary'] = this.salary;
    data['commission'] = this.commission;
    data['__v'] = this.iV;
    return data;
  }
}
