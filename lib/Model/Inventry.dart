class Inventry {
  String? sId;
  String? propertyType;
  String? property;
  String? propertySize;
  String? rooms;
  String? contact;
  String? bedroom;
  String? bathroom;
  String? expectedPrice;
  String? description;
  String? image;
  String? fileNumber;
  String? location;
  String? date;
  int? iV;

  Inventry(
      {this.sId,
        this.propertyType,
        this.property,
        this.propertySize,
        this.rooms,
        this.contact,
        this.bedroom,
        this.bathroom,
        this.expectedPrice,
        this.description,
        this.image,
        this.fileNumber,
        this.location,
        this.date,
        this.iV});

  Inventry.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    propertyType = json['propertyType'];
    property = json['property'];
    propertySize = json['propertySize'];
    rooms = json['rooms'];
    contact = json['contact'];
    bedroom = json['bedroom'];
    bathroom = json['bathroom'];
    expectedPrice = json['ExpectedPrice'];
    description = json['description'];
    image = json['image'];
    fileNumber = json['fileNumber'];
    location = json['location'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['propertyType'] = this.propertyType;
    data['property'] = this.property;
    data['propertySize'] = this.propertySize;
    data['rooms'] = this.rooms;
    data['contact'] = this.contact;
    data['bedroom'] = this.bedroom;
    data['bathroom'] = this.bathroom;
    data['ExpectedPrice'] = this.expectedPrice;
    data['description'] = this.description;
    data['image'] = this.image;
    data['fileNumber'] = this.fileNumber;
    data['location'] = this.location;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}
