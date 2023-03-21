import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_project/res/components/round_button.dart';
import 'package:mvvm_project/utils/routes/routes_name.dart';
import 'package:mvvm_project/utils/utils.dart';
import 'package:mvvm_project/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
FocusNode emailFocusNode = FocusNode();
FocusNode passwordFocusNode = FocusNode();

class _LoginScreenState extends State<LoginScreen> {

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _obscurePassword.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body:SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.email_outlined) 
              ),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
              valueListenable: _obscurePassword, 
              builder: (context, value, child) {
                return TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.emailAddress,
              obscureText: _obscurePassword.value,
              focusNode: passwordFocusNode,
              
              decoration:  InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: InkWell(
                  
                  child: _obscurePassword.value?Icon(Icons.visibility_off_outlined):Icon(Icons.visibility),
                  onTap: () {
                    _obscurePassword.value = !_obscurePassword.value;
                  },)
              ),
              
            );
              },),


              SizedBox(height:10),

              RoundButton(title: "Login", onPress: () {
                if(_emailController.text.isEmpty){
                  Utils.toastMessage("Please enter email");
                 
                }else if(_passwordController.text.isEmpty){
                  Utils.toastMessage("Please enter password");
                }else if(_passwordController.text.length<6){
                 Utils.toastMessage("Password length is less than 6");
                }else{
                    print("Hi");
                    viewModel.submitLoginDetails();   
                    print("Api hit");              
                }
              },)
            
          ],
        ),
      )
    );
  }
}