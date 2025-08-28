import 'package:chill_money/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chill_money/features/auth/presentation/bloc/auth_state.dart';
import 'package:chill_money/features/auth/presentation/screen/login/login_screen.dart';
import 'package:chill_money/features/auth/presentation/screen/register/register_screen.dart';
import 'package:chill_money/features/dashboard/presentation/screen/widget/main_wrapper.dart';
import 'package:chill_money/features/auth/presentation/screen/ondoarding/widgets/advertising_post.dart';
import 'package:chill_money/features/auth/presentation/screen/widgets/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is InititalAuth) {
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 51, 51, 51),
            appBar: CustomAppBar(),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 67, 67, 67),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 29,
                        horizontal: 15,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 420,
                            child: PageView(
                              controller: _controller,
                              onPageChanged: _onPageChanged,
                              children: [
                                AdvertisingPost(),
                                AdvertisingPost(),
                                AdvertisingPost(),
                                AdvertisingPost(),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(4, (index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2),
                                child: Container(
                                  height: 7,
                                  width: 7,
                                  decoration: BoxDecoration(
                                    color: _currentPage == index
                                        ? Colors.green
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromARGB(255, 0, 208, 49),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 17,
                          ),
                          child: Text(
                            'Зарегистрироваться',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Войти',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Version 1.0.0',
                    style: TextStyle(color: Color.fromARGB(255, 114, 114, 144)),
                  ),
                ],
              ),
            ),
          );
        } else if (state is LoadingAuth) {
          return Center(child: CircularProgressIndicator());
        } else if (state is LoadedAuth) {
          return MainWrapper();
        } else if (state is ErrorAuth) {
          return Center(child: Text(state.error));
        } else {
          return Center(child: Text('Произошла ошибка, перезайдите'));
        }
      },
    );
  }
}
