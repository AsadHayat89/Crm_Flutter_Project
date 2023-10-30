class Profit {
  String? sId;
  String? totalEarning;
  String? employeeBonus;
  String? companyProfit;
  String? date;
  int? iV;

  Profit(
      {this.sId,
        this.totalEarning,
        this.employeeBonus,
        this.companyProfit,
        this.date,
        this.iV});

  Profit.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    totalEarning = json['totalEarning'];
    employeeBonus = json['employeeBonus'];
    companyProfit = json['companyProfit'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['totalEarning'] = this.totalEarning;
    data['employeeBonus'] = this.employeeBonus;
    data['companyProfit'] = this.companyProfit;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}
