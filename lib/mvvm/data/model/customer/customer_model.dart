class CustomerModel {
  int? id;
  String? name;
  String? phone1;

  CustomerModel({this.id, this.name, this.phone1});

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        phone1: json['phone1'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone1': phone1,
      };
}
