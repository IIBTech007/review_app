import 'dart:convert';

class QuestionOptions{

 static List<QuestionOptions> questionOptionsListFromJson(String str) => List<QuestionOptions>.from(json.decode(str).map((x) => QuestionOptions.fromJson(x)));
 static String questionOptionsListToJson(List<QuestionOptions> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
  static QuestionOptions questionOptionFromJson(String str) => QuestionOptions.fromJson(json.decode(str));
 static String questionOptionToJson(QuestionOptions data) => json.encode(data.toJson());

 int questionOptionId;
 String questionOptionText;
 double rating;

 QuestionOptions({
  this.questionOptionId,
  this.questionOptionText,
  this.rating
 });
 factory QuestionOptions.fromJson(Map<String, dynamic> json) => QuestionOptions(
    questionOptionId:json["questionOptionId"],
    questionOptionText: json["questionOptionText"],
    rating: json['rating'],
 );
 Map<String, dynamic> toJson() => {
    "questionOptionText":questionOptionText,
    "rating":rating
 };
}