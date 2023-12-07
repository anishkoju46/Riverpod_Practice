import 'dart:convert';

class ApiErrorModel {
  final Error error;

  ApiErrorModel({
    required this.error,
  });

  ApiErrorModel copyWith({
    Error? error,
  }) =>
      ApiErrorModel(
        error: error ?? this.error,
      );

  factory ApiErrorModel.fromRawJson(String str) =>
      ApiErrorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
        error: Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error.toJson(),
      };
}

class Error {
  final int code;
  final String message;

  Error({
    required this.code,
    required this.message,
  });

  Error copyWith({
    int? code,
    String? message,
  }) =>
      Error(
        code: code ?? this.code,
        message: message ?? this.message,
      );

  factory Error.fromRawJson(String str) => Error.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
