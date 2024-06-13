import 'package:flutter/material.dart';

confirmationDiaglog(BuildContext context) async {
  bool willpop = false;
  willpop = await showDialog(
      context: context,
      builder:(context) => AlertDialog(
        title: Text('Are you Sure?'),
        content: Text('Do you want to leave? saved form will be deleted'),
        actions: [
          TextButton(onPressed: () {Navigator.of(context).pop(false);} , child: Text('Cancel')),
          TextButton(onPressed: () {Navigator.of(context).pop(true);}, child: Text('Ok'))
        ],
  ));
  return willpop;
}

Future<String> singleTextInput(BuildContext context,title,textValue) async {

    TextEditingController _controller = TextEditingController();
    _controller.text = textValue;
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$title'),
        content: TextField(controller: _controller,),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(), //<-- SEE HERE
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(_controller.text), // <-- SEE HERE
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ; false;
  }
