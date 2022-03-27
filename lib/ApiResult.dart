class ApiResult {
  final String status;
  final String? message;
  final dynamic data;


  ApiResult({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ApiResult.fromJson(Map<String, dynamic> json) {
    return ApiResult(
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Data {
  String? imageUrl;
  int? answer;
  List<String>? choiceList;

  Data({this.imageUrl, this.answer, this.choiceList});

  Data.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    answer = json['answer'];
    choiceList = json['choice_list'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_url'] = this.imageUrl;
    data['answer'] = this.answer;
    data['choice_list'] = this.choiceList;
    return data;
  }
}