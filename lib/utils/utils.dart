
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart' as Fluttertoast;

//List here all the commmon utils which we can used
class Utils {


  //To show validation message in toast widget
  static toastMessage(String message){
     Fluttertoast.Fluttertoast.showToast(msg: message);
  }

  static void fieldFocusChange(BuildContext context,FocusNode current,FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}