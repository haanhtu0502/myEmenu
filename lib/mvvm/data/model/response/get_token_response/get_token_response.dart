import 'package:json_annotation/json_annotation.dart';

part 'get_token_response.g.dart';

@JsonSerializable()
class GetTokenResponse {
  // @JsonKey(name: 'userId')
  // final int userId;
  //
  // @JsonKey(name: 'token')
  // final String token;
  //
  // @JsonKey(name: 'language')
  // final String language;

  @JsonKey(name: 'jwtToken')
  final String jwtToken;

  GetTokenResponse({
    // required this.userId,
    // required this.token,
    // required this.language,
    required this.jwtToken,
  });

  factory GetTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetTokenResponseToJson(this);
}
