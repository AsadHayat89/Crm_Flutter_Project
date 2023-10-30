class DealModel {
  String? sId;
  String? propertyType;
  String? property;
  String? propertySize;
  String? rooms;
  String? bedroom;
  String? date;
  String? bathroom;
  int? employeeCnic;
  String? employeeName;
  int? customerCnic;
  String? customerName;
  String? actualPrice;
  String? soldPrice;
  String? description;
  String? image;
  String? fileNumber;
  String? location;
  int? iV;

  DealModel(
      {this.sId,
        this.propertyType,
        this.property,
        this.propertySize,
        this.rooms,
        this.bedroom,
        this.bathroom,
        this.employeeCnic,
        this.employeeName,
        this.customerCnic,
        this.customerName,
        this.actualPrice,
        this.soldPrice,
        this.description,
        this.image,
        this.fileNumber,
        this.location,
        this.date,
        this.iV});

  DealModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    propertyType = json['propertyType'];
    property = json['property'];
    propertySize = json['propertySize'];
    rooms = json['rooms'];
    bedroom = json['bedroom'];
    date=json['date'];
    bathroom = json['bathroom'];
    employeeCnic = json['employeeCnic'];
    employeeName = json['employeeName'];
    customerCnic = json['customerCnic'];
    customerName = json['customerName'];
    actualPrice = json['actualPrice'];
    soldPrice = json['soldPrice'];
    description = json['description'];
    image = json['image'];
    fileNumber = json['fileNumber'];
    location = json['location'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['date']=this.date;
    data['propertyType'] = this.propertyType;
    data['property'] = this.property;
    data['propertySize'] = this.propertySize;
    data['rooms'] = this.rooms;
    data['bedroom'] = this.bedroom;
    data['bathroom'] = this.bathroom;
    data['employeeCnic'] = this.employeeCnic;
    data['employeeName'] = this.employeeName;
    data['customerCnic'] = this.customerCnic;
    data['customerName'] = this.customerName;
    data['actualPrice'] = this.actualPrice;
    data['soldPrice'] = this.soldPrice;
    data['description'] = this.description;
    data['image'] = this.image;
    data['fileNumber'] = this.fileNumber;
    data['location'] = this.location;
    data['__v'] = this.iV;
    return data;
  }
}
