class DataConverter {
  static const Map<int, String> _mounth = {
    1: 'января',
    2: 'февраля',
    3: 'марта',
    4: 'апреля',
    5: 'мая',
    6: 'июня',
    7: 'июля',
    8: 'августа',
    9: 'сентября',
    10: 'октября',
    11: 'ноября',
    12: 'декабря',
  };

  static String getStringMonth(int number) {
    return _mounth[number] ?? 'Неизвестное число';
  }
}
