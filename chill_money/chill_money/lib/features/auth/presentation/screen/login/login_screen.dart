import 'package:chill_money/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chill_money/features/auth/presentation/bloc/auth_event.dart';
import 'package:chill_money/features/auth/presentation/screen/register/register_screen.dart';
import 'package:chill_money/features/auth/presentation/screen/ondoarding/ondoarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _fromKey = GlobalKey<FormState>();

  String? _validatorEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Введите email";
    } else if (!RegExp(
      r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
    ).hasMatch(value)) {
      return "Введите корректный e-mail";
    } else {
      return null;
    }
  }

  String? _validatorPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите пороль';
    } else {
      return null;
    }
  }

  void _submitForm() {
    if (_fromKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        LoginEvent(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
      _emailController.clear();
      _passwordController.clear();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 51, 51),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 51, 51, 51),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                );
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 35),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 35),
              child: SizedBox(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 67, 67, 67),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 26,
                          horizontal: 20,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Вход',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 65),
                            Form(
                              key: _fromKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    validator: _validatorEmail,
                                    controller: _emailController,
                                    cursorColor: Colors.white,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                        color: Color.fromRGBO(150, 150, 150, 1),
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    validator: _validatorPassword,
                                    controller: _passwordController,
                                    cursorColor: Colors.white,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        color: Color.fromRGBO(150, 150, 150, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 35),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Color.fromARGB(
                                  255,
                                  0,
                                  208,
                                  49,
                                ),
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                _submitForm();
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 90,
                                  vertical: 15,
                                ),
                                child: Text(
                                  'Войти',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'или',
                              style: TextStyle(
                                color: Color.fromRGBO(150, 150, 150, 1),
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    print('гугл');
                                    BlocProvider.of<AuthBloc>(
                                      context,
                                    ).add(LoginWithGoogleEvent());
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Image.asset(
                                        "assets/images/GI.png",
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Зарегистрироваться',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 208, 49),
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
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
        ],
      ),
    );
  }
}
