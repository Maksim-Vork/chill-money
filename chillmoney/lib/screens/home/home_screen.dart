import 'package:chillmoney/screens/add_operation.dart';
import 'package:chillmoney/screens/home/painter/painter.dart';
import 'package:chillmoney/screens/home/painter/painterLastMonth.dart';
import 'package:chillmoney/transactions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final TransactionsService transactionsService;
  const HomeScreen({super.key, required this.transactionsService});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _onPageChandedLeft() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void _onPageChandedRight() {
    if (_currentPage < 1) {
      setState(() {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SizedBox(
          height: 65,
          width: 65,
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            backgroundColor: Color.fromARGB(255, 67, 255, 111),
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddOperation(
                              transactionsService: widget.transactionsService)))
                  .then((context) {
                setState(() {});
              });
            },
            child: Icon(Icons.add),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 51, 51, 51),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 51, 51, 51),
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: Icon(Icons.search, color: Colors.white, size: 30),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Column(
              children: [
                Container(
                  height: 123,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 67, 67, 67),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Мой кошелек',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            height: 1,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 102, 102, 102),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Всего накоплений',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              widget.transactionsService.allsavings.toString(),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 67, 255, 111),
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 87, 206, 115),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    'Какой-то текст',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Text(
                      'Статистика',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 241,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 67, 67, 67),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 140,
                          child: PageView(
                            onPageChanged: _onPageChanged,
                            controller: _pageController,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Потрачено',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: CustomPainterSpendLast(
                                              transactionsService:
                                                  widget.transactionsService),
                                        ),
                                        Text(
                                          widget.transactionsService
                                              .icomeLastMonth
                                              .toString(),
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 111, 67),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Заработано',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: CustomPainterEerdedLast(
                                                transactionsService: widget
                                                    .transactionsService)),
                                        Text(
                                          widget.transactionsService
                                              .spendingLastMonth
                                              .toString(),
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 67, 255, 111),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Потрачено',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: CustomPainterSpend(
                                              transactionsService:
                                                  widget.transactionsService,
                                            )),
                                        Text(
                                          widget.transactionsService
                                              .spendingCurrentMonth
                                              .toString(),
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 111, 67),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Заработано',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: CustomPainterEerded(
                                            transactionsService:
                                                widget.transactionsService,
                                          ),
                                        ),
                                        Text(
                                          widget.transactionsService
                                              .icomeCurrentMonth
                                              .toString(),
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 67, 255, 111),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  _onPageChandedLeft();
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                )),
                            Text(
                              _currentPage == 1
                                  ? 'В этом месяце'
                                  : 'В прошлом месяце',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {
                                  _onPageChandedRight();
                                },
                                icon: Icon(Icons.arrow_forward_ios,
                                    color: Colors.white))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Text(
                      'Транзакции',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 67, 67, 67),
                      borderRadius: BorderRadius.circular(15)),
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: SizedBox(
                      // ignore: unnecessary_null_comparison
                      child: widget.transactionsService.transactionsList.isEmpty
                          ? Center(
                              child: Text(
                              'Список пуст',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 187, 187, 187),
                              ),
                            ))
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: widget.transactionsService
                                          .transactionsList.length >
                                      5
                                  ? 5
                                  : widget.transactionsService.transactionsList
                                      .length,
                              itemBuilder: (context, index) {
                                return TransactionWidget(
                                  transaction: widget.transactionsService
                                      .transactionsListReversed[index],
                                );
                              }),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class TransactionWidget extends StatelessWidget {
  final Transactions transaction;

  const TransactionWidget({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            transaction.name,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const Spacer(),
          Text(
            '${transaction.sum}',
            style: TextStyle(
              color: transaction.transaction ? Colors.red : Colors.green,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
