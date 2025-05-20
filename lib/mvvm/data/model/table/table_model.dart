import 'package:emenu/mvvm/data/model/floor/floor_model.dart';

class TableModel {
  int? id;
  String? name;
  String? description;
  FloorModel? floor;

  TableModel({this.id, this.name, this.description, this.floor});

  factory TableModel.fromJson(Map<String, dynamic> json) => TableModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        floor: json['floor'] == null
            ? null
            : FloorModel.fromJson(json['floor'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'floor': floor?.toJson(),
      };
}
