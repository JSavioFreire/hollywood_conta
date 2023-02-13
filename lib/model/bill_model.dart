class Bill {
  String id;
  String name;

  Bill({required this.id, required this.name});

  Bill.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
    };
  }
}
