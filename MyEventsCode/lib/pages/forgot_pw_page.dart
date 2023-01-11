import 'package:flutter/material.dart';
import 'package:makemyevent/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key:key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();

}
class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    super.dispose();
  }

    Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailController.text.trim());
      showDialog(
        context: context,
        builder:(context) {
          return AlertDialog(
            content: Text('Password reset link sent'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          },
      );
    }
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
     body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children:[
           Text('Enter your Email and we will send you a password reset link',
           textAlign: TextAlign.center,
             style: TextStyle(fontSize: 20)
           ),
           const SizedBox(height: 25),

           // email textfield
           MyTextField(
             controller: emailController,
             hintText: 'Email',
             obscureText: false,
           ),
           SizedBox(height:10),
           MaterialButton(
               onPressed: () => passwordReset(),
             child: Text('Reset Password'),
             color: Colors.blue


            ),

         ],
    )
    );
}
}