class UOMModel {
  final int? id;
  final String? name;
  final String? code;
  final String? description;

  UOMModel({
    this.id,
    this.name,
    this.code,
    this.description,
  });

  factory UOMModel.fromJson(Map<String, dynamic> json) {
    return UOMModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'description': description,
    };
  }
}
