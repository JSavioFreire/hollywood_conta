class Bill {
  String id;
  String name;
  String company;
  String payDay;
  String value;
  String currentDate;

  Bill({
    required this.id,
    required this.name,
    required this.company,
    required this.payDay,
    required this.value,
    required this.currentDate,
  });

  Bill.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        company = map["company"],
        payDay = map["payDay"],
        value = map["value"],
        currentDate = map["currentDate"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "company": company,
      "payDay": payDay,
      "value": value,
      "currentDate": currentDate
    };
  }
}
