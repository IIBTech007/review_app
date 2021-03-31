import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:review_app/Controllers/QuestionsController.dart';
import 'package:review_app/Models/QuestionOptions.dart';
import 'package:review_app/components/colorConstants.dart';

class AddOptions extends StatefulWidget {
  int businessId, categoryId,subCategoryId,questionTypeId;
  String questionText;

  AddOptions({this.businessId, this.categoryId, this.subCategoryId,
      this.questionTypeId, this.questionText});

  @override
  _AddOptionsState createState() => _AddOptionsState();
}

class _AddOptionsState extends State<AddOptions> {
  var optionTextTECS = <TextEditingController>[];
  var ratingTECS = <TextEditingController>[];
  var cards = <Card>[];
  int id=null;
  final _questionController=Get.find<QuestionController>();
  Card createCard() {
    id??null;
    var optionText = TextEditingController();
    var rating = TextEditingController();
    optionTextTECS.add(optionText);
    ratingTECS.add(rating);
    return Card(
      elevation: 10,
      color: color4,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: color3, width: 1)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:16.0),
              child: Text('Option ${cards.length + 1}'),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                  controller: optionText,
                  decoration: InputDecoration(labelText: 'Option Text'),
                  keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16,left: 16,right: 16),
              child: TextField(
                  controller: rating,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(labelText: 'Rating')
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    cards.add(createCard());
  }

  _onDone() {
    List<QuestionOptions> entries = [];
    for (int i = 0; i < cards.length; i++) {
      var optionText = optionTextTECS[i].text;
      var rating = ratingTECS[i].text;
      entries.add(QuestionOptions(rating: double.parse(rating),questionOptionText: optionText));
    }
    _questionController.optionsList.assignAll(entries);
    _questionController.AddQuestions(widget.businessId, widget.categoryId, widget.subCategoryId, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Question Options", style:
      GoogleFonts.prompt(
        textStyle: TextStyle(
            color: color4,
            fontSize: 22,
            fontWeight: FontWeight.bold
        ),
      ),
        ),
        iconTheme: IconThemeData(
            color: color4
        ),
        centerTitle: true,
        backgroundColor: color3,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: cards[index],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:  InkWell(
              onTap: () => setState(() => cards.add(createCard())),
              child: Center(
                child: Card(
                  elevation: 6,
                  color: color3,
                  child: Container(
                    height: 55,
                    width: 220,
                    decoration: BoxDecoration(
                      color: color3,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text("ADD", style: GoogleFonts.prompt(
                        textStyle: TextStyle(
                            color: color3,
                            //fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton:
      FloatingActionButton(child: Icon(Icons.done, color: color4,), onPressed: _onDone, backgroundColor: color3,),
    );
  }
}