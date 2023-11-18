class Expenses {
  String? expenseType;
  String? expenseAmount;
  String? description;
  String? employeeIds;
  String? sId;
  String? image;
  int? iV;

  Expenses(
      {this.expenseType,
        this.expenseAmount,
        this.description,
        this.employeeIds,
        this.sId,
        this.image,
        this.iV});

  Expenses.fromJson(Map<String, dynamic> json) {
    expenseType = json['expenseType'];
    expenseAmount = json['expenseAmount'];
    description = json['description'];
    employeeIds = json['employeeIds'];
    sId = json['_id'];
    image=json['image'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expenseType'] = this.expenseType;
    data['expenseAmount'] = this.expenseAmount;
    data['description'] = this.description;
    data['employeeIds'] = this.employeeIds;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    data['image']=this.image;
    return data;
  }
}
