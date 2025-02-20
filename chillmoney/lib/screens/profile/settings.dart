import 'package:flutter/material.dart';

class Settings {
  final String name;
  final IconData icon;
  Settings({required this.name, required this.icon});
}

class ServiceSettings {
  final List<Settings> _settingsList = [
    Settings(name: 'Общие', icon: Icons.tune),
    Settings(name: 'Категории расходов', icon: Icons.category),
    Settings(name: 'Категории доходов', icon: Icons.attach_money),
    Settings(name: 'Валюты', icon: Icons.currency_exchange),
    Settings(name: 'Напоминания', icon: Icons.notifications),
    Settings(name: 'Безопасность', icon: Icons.lock),
    Settings(name: 'Экспорт данных', icon: Icons.file_download),
    Settings(name: 'Импорт данных', icon: Icons.file_upload),
    Settings(name: 'Тема приложения', icon: Icons.dark_mode),
    Settings(name: 'Автосинхронизация', icon: Icons.sync),
    Settings(name: 'Язык', icon: Icons.language),
    Settings(name: 'О приложении', icon: Icons.info),
  ];
  List<Settings> get settingsList => _settingsList;
}
