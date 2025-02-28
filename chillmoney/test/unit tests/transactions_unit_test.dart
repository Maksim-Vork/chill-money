import 'package:chillmoney/data/transactions.dart';

import 'package:test/test.dart';

void main() {
  group('TransactionsService', () {
    late TransactionsService transactionsService;

    setUp(() {
      transactionsService = TransactionsService();
    });

    test('Добавление транзакции', () {
      expect(transactionsService.transactionsList.length, equals(0));

      transactionsService.addTransaction('Продукты', 1000, true);

      expect(transactionsService.transactionsList.length, equals(1));
    });

    test('Увеличение общих накоплений', () {
      expect(transactionsService.allSavings, equals(0));

      transactionsService.addTransaction('Работа', 2000, false);
      transactionsService.addTransaction('Продукты', 400, true);

      expect(transactionsService.allSavings, equals(1600));
    });
    test('Подсчет трат за месяц', () {
      expect(transactionsService.allSavings, equals(0));

      transactionsService.addTransaction('Продукты', 1000, true);
      transactionsService.addTransaction('Продукты', 2000, true);

      expect(transactionsService.spendingCurrentMonth, equals(3000));
    });
    test('Распределение транзакций по месяцам', () {
      expect(transactionsService.allSavings, equals(0));
      transactionsService.addTransaction('Продукты', 1000, true);
      transactionsService.addTransaction('Путешествие', 1000, true);
      transactionsService.addTransaction('Развлечение', 1000, true);

      expect(transactionsService.currentMonthList.length, equals(1));
    });
    test('Добавление транзакций по дням в map', () {
      expect(transactionsService.allSavings, equals(0));
      transactionsService.addTransaction('Продукты', 1000, true);
      transactionsService.addTransaction('Развлечение', 1000, true);

      expect(transactionsService.currentMonth.length, equals(1));
    });
  });
}
