import 'package:flutter/material.dart';
import 'package:flutter_mobile/utils/util_func.dart';
import 'package:flutter_mobile/utils/validators.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  void _sendFeedback() async {
    if (!Validator.isValidName(_nameController.text)) {
      UtilityFunction.showAlertDialog(
          context, "Error", "Please enter your name", false);
      return;
    } else if (!Validator.isValidEmail(_emailController.text)) {
      UtilityFunction.showAlertDialog(
          context, "Error", "Please enter a valid email address", false);
      return;
    } else if (!Validator.isValidSubject(_subjectController.text)) {
      UtilityFunction.showAlertDialog(
          context, "Error", "Please enter your subject", false);
      return;
    } else if (!Validator.isValidMessage(_messageController.text)) {
      UtilityFunction.showAlertDialog(
          context, "Error", "Please enter your message", false);
      return;
    } else {
      // await UtilService.sendFeedback(
      //     _nameController.text,
      //     _emailController.text,
      //     _subjectController.text,
      //     _messageController.text);
      UtilityFunction.showAlertDialog(
          context, "Success", "Your feedback has been sent successfully", true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Feedback'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: Theme(
                  child: TextFormField(
                    maxLines: null,
                    textCapitalization: TextCapitalization.sentences,
                    controller: _nameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline),
                      labelText: "Your Name",
                      labelStyle: TextStyle(),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(color: Theme.of(context).accentColor),
                      ),
                    ),
                  ),
                  data: Theme.of(context).copyWith(
                    primaryColor: Theme.of(context).accentColor,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: Theme(
                  child: TextFormField(
                    maxLines: null,
                    textCapitalization: TextCapitalization.sentences,
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      labelText: "Your Email",
                      labelStyle: TextStyle(),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(color: Theme.of(context).accentColor),
                      ),
                    ),
                  ),
                  data: Theme.of(context).copyWith(
                    primaryColor: Theme.of(context).accentColor,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: Theme(
                  child: TextFormField(
                    maxLines: null,
                    textCapitalization: TextCapitalization.sentences,
                    controller: _subjectController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.subject),
                      labelText: "Subject",
                      labelStyle: TextStyle(),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(color: Theme.of(context).accentColor),
                      ),
                    ),
                  ),
                  data: Theme.of(context).copyWith(
                    primaryColor: Theme.of(context).accentColor,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: Theme(
                  child: TextFormField(
                    maxLines: null,
                    textCapitalization: TextCapitalization.sentences,
                    controller: _messageController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.message_outlined),
                      labelText: "Message",
                      labelStyle: TextStyle(),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(color: Theme.of(context).accentColor),
                      ),
                    ),
                  ),
                  data: Theme.of(context).copyWith(
                    primaryColor: Theme.of(context).accentColor,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 50.0,
                child: ElevatedButton(
                  child: Text(
                    "Send Feedback",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    _sendFeedback();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
