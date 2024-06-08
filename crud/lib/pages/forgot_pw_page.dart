import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final _emailController = TextEditingController();

  @override
  void dispose() {
   _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try{
      await FirebaseAuth.instance.
      sendPasswordResetEmail(email: _emailController.text.trim());

      showDialog(
        context: context,
         builder: (context){
          return const AlertDialog(
            content: Text("Password rest link sent on your email"),
          );
         }
         );
      
    } on FirebaseAuthException catch(e){
      print(e);
      showDialog(
        context: context,
         builder: (context){
          return AlertDialog(
            content: Text(e.message.toString()),
          );
         }
         );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal:15),
            child: Text(
              'To reset your password enter your email to get password reset link',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 20,),
          //email text field
          Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailController,
                    autocorrect: false,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.green),
                        ),
                        hintText: 'Enter Email',
                        fillColor: Colors.grey[200],
                        filled: true,
                    ),
                  ),
                ),
          MaterialButton(
                onPressed: passwordReset,

              child: const Text('Reset Password'),
              color: Colors.blueAccent,
                
              ),
              
        ],
      ),
    );
  }
}