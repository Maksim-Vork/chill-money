import 'package:chill_money/core/utils/data_converter.dart';
import 'package:chill_money/features/transactions/domain/entity/transaction.dart';
import 'package:chill_money/features/transactions/presentation/bloc/transact_bloc.dart';
import 'package:chill_money/features/transactions/presentation/bloc/transact_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryOperation extends StatefulWidget {
  const HistoryOperation({super.key});

  @override
  State<HistoryOperation> createState() => _HistoryOperationState();
}

class _HistoryOperationState extends State<HistoryOperation> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onPageChandedLeft() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _pageController.animateToPage(
          _currentIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void _onPageChandedRight() {
    if (_currentIndex < 1) {
      setState(() {
        _currentIndex++;
        _pageController.animateToPage(
          _currentIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactBloc, TransactState>(
      builder: (context, state) {
        if (state is InitialTransactState || state is LoadingTransactState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is LoadedTransactState) {
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 51, 51, 51),
            appBar: AppBar(
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(1.0),
                child: Container(color: Colors.grey, height: 1.0),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              backgroundColor: Color.fromARGB(255, 51, 51, 51),
              title: Column(
                children: [
                  Text(
                    'История операций',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          _onPageChandedLeft();
                        },
                        child: Text(
                          'В этом месяце',
                          style: TextStyle(
                            color: _currentIndex == 0
                                ? Colors.white
                                : Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _onPageChandedRight();
                        },
                        child: Text(
                          'В прошлом месяце',
                          style: TextStyle(
                            color: _currentIndex == 1
                                ? Colors.white
                                : Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: PageView(
                      onPageChanged: _onPageChanged,
                      controller: _pageController,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Container(
                                width: double.infinity,

                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 67, 67, 67),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 17,
                                    horizontal: 16,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Статистика',
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromARGB(
                                                255,
                                                191,
                                                191,
                                                191,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Доходы',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: const Color.fromARGB(
                                                255,
                                                162,
                                                162,
                                                162,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            state.stats.currentIcome
                                                .toInt()
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: const Color.fromARGB(
                                                255,
                                                0,
                                                208,
                                                49,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Расходы',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: const Color.fromARGB(
                                                255,
                                                162,
                                                162,
                                                162,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            state.stats.currentExpens
                                                .toInt()
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: const Color.fromARGB(
                                                255,
                                                208,
                                                0,
                                                0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        height: 1,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                            255,
                                            102,
                                            102,
                                            102,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Итого',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: const Color.fromARGB(
                                                255,
                                                255,
                                                255,
                                                255,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            (state.stats.currentIcome -
                                                    state.stats.currentExpens)
                                                .toInt()
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: const Color.fromARGB(
                                                255,
                                                255,
                                                255,
                                                255,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              state.transactionsByCurrentMounth.isEmpty
                                  ? Text(
                                      'Список пуст',
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                          255,
                                          134,
                                          134,
                                          134,
                                        ),
                                      ),
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: state
                                          .transactionsByCurrentMounth
                                          .length,
                                      itemBuilder: (context, index) {
                                        return TransactionDay(
                                          mapEntryDay: state
                                              .transactionsByCurrentMounth[index],
                                        );
                                      },
                                    ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Container(
                                width: double.infinity,

                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 67, 67, 67),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 17,
                                    horizontal: 16,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Статистика',
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromARGB(
                                                255,
                                                191,
                                                191,
                                                191,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Доходы',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: const Color.fromARGB(
                                                255,
                                                162,
                                                162,
                                                162,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            state.stats.pastExpens
                                                .toInt()
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: const Color.fromARGB(
                                                255,
                                                0,
                                                208,
                                                49,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Расходы',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: const Color.fromARGB(
                                                255,
                                                162,
                                                162,
                                                162,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            state.stats.pastIcome
                                                .toInt()
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: const Color.fromARGB(
                                                255,
                                                208,
                                                0,
                                                0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        height: 1,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                            255,
                                            102,
                                            102,
                                            102,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Итого',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: const Color.fromARGB(
                                                255,
                                                255,
                                                255,
                                                255,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            (state.stats.pastIcome -
                                                    state.stats.pastExpens)
                                                .toInt()
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: const Color.fromARGB(
                                                255,
                                                255,
                                                255,
                                                255,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 22),
                              state.transactionsByLastMounth.isEmpty
                                  ? Text(
                                      'Список пуст',
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                          255,
                                          134,
                                          134,
                                          134,
                                        ),
                                      ),
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount:
                                          state.transactionsByLastMounth.length,
                                      itemBuilder: (context, index) {
                                        return TransactionDay(
                                          mapEntryDay: state
                                              .transactionsByLastMounth[index],
                                        );
                                      },
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 11),
                ],
              ),
            ),
          );
        } else if (state is ErrorTransactState) {
          return Center(child: Text(state.error));
        } else {
          return Center(child: Text('Перезапустите приложение'));
        }
      },
    );
  }
}

class TransactionDay extends StatefulWidget {
  final MapEntry<DateTime, List<Transact>> mapEntryDay;
  const TransactionDay({super.key, required this.mapEntryDay});

  @override
  State<TransactionDay> createState() => _TransactionDayState();
}

class _TransactionDayState extends State<TransactionDay> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 11),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(152, 68, 68, 68),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 11),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.mapEntryDay.key.day}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    DataConverter.getStringMonth(widget.mapEntryDay.key.month),
                    style: TextStyle(
                      color: const Color.fromARGB(255, 154, 154, 154),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 102, 102, 102),
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.mapEntryDay.value.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return TransactionInDay(
                    transaction: widget.mapEntryDay.value[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionInDay extends StatelessWidget {
  final Transact transaction;
  const TransactionInDay({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              SizedBox(width: 17),
              Text(
                transaction.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Text(
            transaction.sum.toString(),
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
