import 'package:chill_money/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chill_money/features/auth/presentation/bloc/auth_event.dart';
import 'package:chill_money/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:chill_money/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:chill_money/features/dashboard/presentation/screen/widget/painter/painter.dart';
import 'package:chill_money/features/dashboard/presentation/screen/widget/painter/painterLastMonth.dart';
import 'package:chill_money/features/transactions/domain/entity/transaction.dart';
import 'package:chill_money/features/transactions/presentation/bloc/transact_bloc.dart';
import 'package:chill_money/features/transactions/presentation/bloc/transact_state.dart';
import 'package:chill_money/features/transactions/presentation/screens/create_transaction/add_operation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
              MaterialPageRoute(builder: (context) => AddOperation()),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 51, 51, 51),
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 51, 51, 51),
        title: Row(
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
            IconButton(
              visualDensity: VisualDensity.compact,
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
              },
              icon: Icon(Icons.logout_outlined, size: 25, color: Colors.white),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              if (state is InitialDashboardState ||
                  state is LoadingDashboardState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Center(child: CircularProgressIndicator())],
                );
              } else if (state is LoadedDashboardState) {
                return Column(
                  children: [
                    Container(
                      height: 123,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 67, 67, 67),
                        borderRadius: BorderRadius.circular(15),
                      ),
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
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Container(
                              height: 1,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 102, 102, 102),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Всего накоплений',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),

                                Text(
                                  state.savings.amount.toString(),
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 67, 255, 111),
                                    fontSize: 38,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 87, 206, 115),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'Рекламный баннер',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Статистика',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          BlocBuilder<TransactBloc, TransactState>(
                            builder: (context, state) {
                              if (state is InitialTransactState ||
                                  state is LoadingTransactState) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is LoadedTransactState) {
                                return Container(
                                  height: 241,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 67, 67, 67),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 18,
                                      vertical: 20,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                                vertical: 10,
                                                              ),
                                                          child: CustomPainterSpendLast(
                                                            numberExpens: state
                                                                .stats
                                                                .pastExpens
                                                                .toInt(),
                                                          ),
                                                        ),
                                                        Text(
                                                          state.stats.pastExpens
                                                              .toString(),
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                  255,
                                                                  255,
                                                                  111,
                                                                  67,
                                                                ),
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
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
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                                vertical: 10,
                                                              ),
                                                          child:
                                                              CustomPainterEerdedLast(
                                                                numberIcome: state
                                                                    .stats
                                                                    .pastIcome
                                                                    .toInt(),
                                                              ),
                                                        ),
                                                        Text(
                                                          state.stats.pastIcome
                                                              .toString(),
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                  255,
                                                                  67,
                                                                  255,
                                                                  111,
                                                                ),
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
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
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                                vertical: 10,
                                                              ),
                                                          child: CustomPainterSpend(
                                                            numberExpens: state
                                                                .stats
                                                                .currentExpens
                                                                .toInt(),
                                                          ),
                                                        ),
                                                        Text(
                                                          state
                                                              .stats
                                                              .currentExpens
                                                              .toString(),
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                  255,
                                                                  255,
                                                                  111,
                                                                  67,
                                                                ),
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
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
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                                vertical: 10,
                                                              ),
                                                          child: CustomPainterEerded(
                                                            numberIcome: state
                                                                .stats
                                                                .currentIcome
                                                                .toInt(),
                                                          ),
                                                        ),
                                                        Text(
                                                          state
                                                              .stats
                                                              .currentIcome
                                                              .toString(),
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                  255,
                                                                  67,
                                                                  255,
                                                                  111,
                                                                ),
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                _onPageChandedLeft();
                                              },
                                              icon: Icon(
                                                Icons.arrow_back_ios,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              _currentPage == 1
                                                  ? 'В этом месяце'
                                                  : 'В прошлом месяце',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                _onPageChandedRight();
                                              },
                                              icon: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else if (state is ErrorTransactState) {
                                return Center(child: Text(state.error));
                              } else {
                                return Center(
                                  child: Text('Перезапустите приложение'),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24),
                    Row(
                      children: [
                        Text(
                          'Транзакции',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    BlocBuilder<TransactBloc, TransactState>(
                      builder: (context, state) {
                        if (state is LoadingTransactState ||
                            state is InitialTransactState) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is LoadedTransactState) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 67, 67, 67),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              child: SizedBox(
                                // ignore: unnecessary_null_comparison
                                child: state.transactionsByCurrentMounth.isEmpty
                                    ? Center(
                                        child: Text(
                                          'Список пуст',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              255,
                                              187,
                                              187,
                                              187,
                                            ),
                                          ),
                                        ),
                                      )
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount:
                                            state
                                                    .transactionsByCurrentMounth
                                                    .first
                                                    .value
                                                    .length >
                                                5
                                            ? 5
                                            : state
                                                  .transactionsByCurrentMounth
                                                  .first
                                                  .value
                                                  .length,
                                        itemBuilder: (context, index) {
                                          return TransactionWidget(
                                            transaction: state
                                                .transactionsByCurrentMounth
                                                .first
                                                .value[index],
                                          );
                                        },
                                      ),
                              ),
                            ),
                          );
                        } else if (state is ErrorTransactState) {
                          return Center(child: Text(state.error));
                        } else {
                          return Center(child: Text('Ошибка'));
                        }
                      },
                    ),
                  ],
                );
              } else if (state is ErrorDashboardState) {
                return Center(child: Text(state.error));
              } else {
                return Center(child: Text('Перезагрузите приложение'));
              }
            },
          ),
        ),
      ),
    );
  }
}

class TransactionWidget extends StatelessWidget {
  final Transact transaction;
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
              color: transaction.isSpend ? Colors.red : Colors.green,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
