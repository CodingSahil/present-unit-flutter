class FieldValidation {
  FieldValidation({required this.isError, this.message});

  final bool isError;
  final String? message;

  FieldValidation copyWith({bool? isError, String? message}) =>
      FieldValidation(isError: isError ?? this.isError, message: message ?? this.message);

  Map<String, dynamic> toJson() => {"isError": isError, if (message != null) "message": message};
}
