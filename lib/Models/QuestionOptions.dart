class QuestionOptions{
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