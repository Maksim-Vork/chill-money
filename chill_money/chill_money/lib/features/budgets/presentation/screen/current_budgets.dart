import 'package:chill_money/features/budgets/domain/entity/budget.dart';
import 'package:chill_money/features/budgets/presentation/bloc/budget_bloc.dart';
import 'package:chill_money/features/budgets/presentation/bloc/budget_event.dart';
import 'package:chill_money/features/budgets/presentation/bloc/budget_state.dart';
import 'package:chill_money/features/budgets/presentation/screen/createBudget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentBudgets extends StatefulWidget {
  const CurrentBudgets({super.key});

  @override
  State<CurrentBudgets> createState() => _CurrentBudgetsState();
}

class _CurrentBudgetsState extends State<CurrentBudgets> {
  @override
  Widget build(BuildContext context) {
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
        title: Text(
          'Текущие бюджеты',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: IconButton(
              icon: Icon(Icons.more_vert, color: Colors.white, size: 30),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: BlocBuilder<BudgetBloc, BudgetState>(
        builder: (context, state) {
          if (state is InitialBudget || state is LoadingBudget) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoadedBudget) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.budgets.length,
                      itemBuilder: (context, index) {
                        return BudgetModule(budget: state.budgets[index]);
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateBudget(),
                          ),
                        ).then((value) {
                          setState(() {});
                        });
                      },
                      child: Text(
                        'Добавить бютжет',
                        style: TextStyle(
                          color: Color.fromARGB(255, 67, 255, 111),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is ErorBudget) {
            return Center(child: Text(state.error));
          } else {
            return Center(
              child: Text('Произошла неизвестная ошибка, перезайдите'),
            );
          }
        },
      ),
    );
  }
}

class BudgetModule extends StatefulWidget {
  final Budget budget;

  const BudgetModule({super.key, required this.budget});

  @override
  State<BudgetModule> createState() => _BudgetModuleState();
}

class _BudgetModuleState extends State<BudgetModule> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 296,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(255, 67, 67, 67),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.budget.name,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 192, 192, 192),
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<BudgetBloc>(
                        context,
                      ).add(DeleteBudgetEvent(id: widget.budget.id));
                    },
                    icon: Icon(Icons.delete, color: Colors.grey),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 60),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            size: Size(200, 100),
                            painter: BudgetPainter(
                              spent: widget.budget.spent.toDouble(),
                              total: widget.budget.totalAmount.toDouble(),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                widget.budget.remainder.toString(),
                                style: TextStyle(
                                  color: Color.fromARGB(255, 67, 255, 111),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Остаток',
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    192,
                                    192,
                                    192,
                                  ),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          widget.budget.totalAmount.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Общий бюджет',
                          style: TextStyle(
                            fontSize: 12,
                            color: const Color.fromARGB(255, 192, 192, 192),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 62,
                    width: 1,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 192, 192, 192),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          widget.budget.spent.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Всего потрачено',
                          style: TextStyle(
                            fontSize: 12,
                            color: const Color.fromARGB(255, 192, 192, 192),
                            fontWeight: FontWeight.w400,
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
      ),
    );
  }
}

class BudgetPainter extends CustomPainter {
  final double spent;
  final double total;

  BudgetPainter({required this.spent, required this.total});

  @override
  void paint(Canvas canvas, Size size) {
    final paintBackground = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    final paintProgress = Paint()
      ..color = Color.fromARGB(255, 67, 255, 111)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2,
      ),
      3.14,
      3.14,
      false,
      paintBackground,
    );

    double progressAngle = (1 - (spent / total)) * 3.14;

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2,
      ),
      3.14,
      progressAngle,
      false,
      paintProgress,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
