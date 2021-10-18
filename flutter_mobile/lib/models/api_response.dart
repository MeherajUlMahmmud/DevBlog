class APIResponse<T> {
  bool isSuccessful;
  T data;
  String message;
  int statusCode;

  APIResponse(this.isSuccessful, this.data, this.message, this.statusCode);

  factory APIResponse.fromJson(Map<String, dynamic> json) {
    return APIResponse(
      json['isSuccessful'],
      json['data'],
      json['message'],
      json['responseCode'],
    );
  }
}
