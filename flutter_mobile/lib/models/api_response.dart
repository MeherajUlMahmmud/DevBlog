class APIResponse<T> {
  final bool isSuccessful;
  final T data;
  final String message;
  final int statusCode;

  APIResponse({this.isSuccessful, this.data, this.message, this.statusCode});

  factory APIResponse.fromJson(Map<String, dynamic> json) {
    return APIResponse(
      isSuccessful: json['isSuccessful'],
      data: json['data'],
      message: json['message'],
      statusCode: json['statusCode'],
    );
  }
}
