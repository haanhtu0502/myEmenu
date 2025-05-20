class FloorModel {
  int? id;
  String? name;
  String? floorNo;

  FloorModel({required this.id, required this.name, required this.floorNo});

  factory FloorModel.fromJson(Map<String, dynamic> json) => FloorModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        floorNo: json['floorNo'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'floorNo': floorNo,
      };
}
