import 'package:chillmoney/screens/login/login.dart';
import 'package:chillmoney/screens/welcom/welcome_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? _validatorUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Некоректное имя';
    } else if (value.length > 15) {
      return 'Слишком длинное';
    } else {
      return null;
    }
  }

  String? _validatorEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email не коректный';
    } else if (!RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')
        .hasMatch(value)) {
      return "Введите корректный e-mail";
    } else {
      return null;
    }
  }

  String? _validatorPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Некоректный пороль';
    } else if (value.length < 6) {
      return 'Пороль меньше 6 символов';
    } else {
      return null;
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
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
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen()));
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 35,
                  ))
            ],
          )),
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
                        padding:
                            EdgeInsets.symmetric(vertical: 26, horizontal: 20),
                        child: Column(
                          children: [
                            Text(
                              'Регистрация',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 65,
                            ),
                            Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      validator: _validatorUserName,
                                      controller: _userNameController,
                                      cursorColor: Colors.white,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          hintText: 'Username',
                                          hintStyle: TextStyle(
                                              color: Color.fromRGBO(
                                                  150, 150, 150, 1))),
                                    ),
                                    TextFormField(
                                      validator: _validatorEmail,
                                      controller: _emailController,
                                      cursorColor: Colors.white,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          hintText: 'Email',
                                          hintStyle: TextStyle(
                                              color: Color.fromRGBO(
                                                  150, 150, 150, 1))),
                                    ),
                                    TextFormField(
                                      validator: _validatorPassword,
                                      controller: _passwordController,
                                      cursorColor: Colors.white,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          hintText: 'Password',
                                          hintStyle: TextStyle(
                                              color: Color.fromRGBO(
                                                  150, 150, 150, 1))),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 35,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    Color.fromARGB(255, 0, 208, 49),
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
                                    horizontal: 14, vertical: 15),
                                child: Text(
                                  'Зарегистрироваться',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'или',
                              style: TextStyle(
                                color: Color.fromRGBO(150, 150, 150, 1),
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Image.asset(
                                        "assets/images/APL.png",
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Image.asset(
                                        "assets/images/WK.png",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              'Войти',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 208, 49),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
