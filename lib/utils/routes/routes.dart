import 'package:flutter/material.dart';
import 'package:mvvm_project/utils/routes/routes_name.dart';
import 'package:mvvm_project/view/home_screen.dart';
import 'package:mvvm_project/view/login/login_screen.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder:  (context) => HomeScreen());
      
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => LoginScreen(),);
      default:
        return MaterialPageRoute(builder: (_) {
          
          return Scaffold(body: Center(child: Text("No routes found")));
        },);
    }

  }
  
}