import 'package:chillmoney/screens/login/login.dart';
import 'package:chillmoney/screens/register/register.dart';
import 'package:chillmoney/screens/welcom/advertising_post.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Color.fromARGB(255, 51, 51, 51),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            Icons.savings,
            color: Color.fromARGB(255, 0, 208, 49),
            size: 35,
          ),
          SizedBox(width: 8),
          Text(
            'Chill Money',
            style: TextStyle(
              color: Color.fromARGB(255, 67, 255, 111),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 51, 51),
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 67, 67, 67),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 29, horizontal: 19),
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
                              borderRadius: BorderRadius.circular(50),
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
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 17),
                    child: Text(
                      'Зарегистрироваться',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
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
  }
}
