import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/auth/forget_pass_email_screen.dart';
import 'package:task_manager/ui/screens/auth/login_screen.dart';
import 'package:task_manager/widgets/custom_button.dart';
import 'package:task_manager/widgets/screen_background.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Update Password',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    'Minimum length password 8 character with\nLetter and Number combination',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Confirm Password'),
                  ),
                  CustomIconButton(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account?",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgetPassEmailScreen(),
                              ));
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color: Color(0xff21bf73),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
