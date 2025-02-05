import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/screens/auth/login_screen.dart';
import 'package:task_manager/widgets/custom_button.dart';
import 'package:task_manager/widgets/screen_background.dart';

class SignupFormScreen extends StatefulWidget {
  const SignupFormScreen({super.key});

  @override
  State<SignupFormScreen> createState() => _SignupFormScreenState();
}

class _SignupFormScreenState extends State<SignupFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _firstNameTEC = TextEditingController();
  final TextEditingController _lastNameTEC = TextEditingController();
  final TextEditingController _mobileTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();

  bool _signupInProgress = false;

  Future<void> userSignUp() async {
    _signupInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.registration, <String, dynamic>{
      'email': _emailTEC.text.trim(),
      'firstName': _firstNameTEC.text.trim(),
      'lastName': _lastNameTEC.text.trim(),
      'mobile': _mobileTEC.text.trim(),
      'password': _passwordTEC.text,
      'photo': '',
    });
    _signupInProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      _emailTEC.clear();
      _firstNameTEC.clear();
      _lastNameTEC.clear();
      _mobileTEC.clear();
      _passwordTEC.clear();
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Registration Successful')));
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Registration Failed')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Join With Us',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 8),
                  child: TextFormField(
                    validator: (String? value) {
                      if (value?.isEmpty == true) {
                        return 'Enter your email';
                      }
                      return null;
                    },
                    controller: _emailTEC,
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.isEmpty == true) {
                      return 'Enter your first name';
                    }
                    return null;
                  },
                  controller: _firstNameTEC,
                  decoration: InputDecoration(hintText: 'First Name'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    validator: (String? value) {
                      if (value?.isEmpty == true) {
                        return 'Enter your last name';
                      }
                      return null;
                    },
                    controller: _lastNameTEC,
                    decoration: InputDecoration(hintText: 'Last Name'),
                  ),
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.isEmpty ?? true && value?.length != 11) {
                      return 'Enter your mobile';
                    }
                    return null;
                  },
                  controller: _mobileTEC,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(hintText: 'Mobile'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    validator: (String? value) {
                      if (value?.isEmpty ?? true && value!.length < 6) {
                        return 'Enter your password';
                      }
                      return null;
                    },
                    controller: _passwordTEC,
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 20),
                  child: Visibility(
                    visible: _signupInProgress == false,
                    replacement: Center(child: CircularProgressIndicator()),
                    child: CustomIconButton(
                      onTap: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        userSignUp();
                        if (mounted) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                            (route) => false,
                          );
                        }
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an account ?",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
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
    );
  }
}
