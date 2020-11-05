class City {
  String name;

  City(this.name);

  City.fromJson(Map<String, dynamic> json) : name = json['city'];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is City && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
