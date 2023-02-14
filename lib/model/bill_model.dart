class Bill {
  String id;
  String name;
  String company;
  String payDay;
  String value;

  Bill({
    required this.id,
    required this.name,
    required this.company,
    required this.payDay,
    required this.value,
  });

  Bill.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        company = map["company"],
        payDay = map["payDay"],
        value = map["value"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "company": company,
      "payDay": payDay,
      "value": value,
    };
  }
}
