import 'package:flutter/material.dart';

class GameDataProvider with ChangeNotifier {
  final List<Extension> _extensions = [
    Extension(0, 'База'),
    Extension(1, 'Проклятие Темного Фараона'),
    Extension(2, 'Ужас Данвича'),
    Extension(3, 'Король в Желтом'),
    Extension(4, 'Ужас Кингспорта'),
    Extension(5, 'Черная Коза Чащоб'),
    Extension(6, 'Ужас Иннсмута'),
    Extension(7, 'Затаившийся у Порога'),
    Extension(8, 'Ужас Мискатоника'),
  ];
  final List<Ancient> _ancients = [
    Ancient("Азатот", 0),
    Ancient("Итаква", 0),
    Ancient("Йиг", 0),
    Ancient("Йог-сотот", 0),
    Ancient("Ктулху", 0),
    Ancient("Ньярлатотеп", 0),
    Ancient("Хастур", 0),
    Ancient("Шаб-ниггурат", 0),
    Ancient("Абхот", 2),
    Ancient("Атлач-Нача", 4),
    Ancient("Бокруг", 6),
    Ancient("Глааки", 2),
    Ancient("Гхатанотоа", 6),
    Ancient("Зхар", 6),
    Ancient("И'Голонак", 4),
    Ancient("Йиб-Тстлл", 4),
    Ancient("Ктугха", 6),
    Ancient("Куахил Уттаус", 6),
    Ancient("Ньогта", 6),
    Ancient("Рхан-тегот", 6),
    Ancient("Хаугнар Фаугн", 6),
    Ancient("Цатхоггуа", 2),
    Ancient("Шудде-Мьелл", 2),
    Ancient("Эйхорт", 4),
  ];
  final List<Herald> _heralds = [
    Herald("Отец Дагон", 6),
    Herald("Грот", 4),
    Herald("Затаившийся у порога", 7),
    Herald("Мать Гидра", 6),
    Herald("Черная Коза Чащоб", 5),
    Herald("Король в желтом", 3),
    Herald("Тульцча", 4),
    Herald("Темный Фараон", 1),
    Herald("Баст", 4),
    Herald("Гипнос", 4),
    Herald("Ноденс", 4),
  ];
  final List<Investigator> _investigators = [
    Investigator("Аманда Шарп", 0),
    Investigator("Боб Дженкинс", 0),
    Investigator("Винсент Ли", 0),
    Investigator("Глория Голдберг", 0),
    Investigator("Даррелл Симонс", 0),
    Investigator("Декстер Дрейк", 0),
    Investigator("Дженни Барнс", 0),
    Investigator("Джо Даймонд", 0),
    Investigator("Кейт Уинтроп", 0),
    Investigator("Кэролин Ферн", 0),
    Investigator("Майкл МакГленн", 0),
    Investigator("Монтерей Джек", 0),
    Investigator("Мэнди Томпсон", 0),
    Investigator("Пит Мусорщик", 0),
    Investigator("Сестра Мэри", 0),
    Investigator("Харви Уолтерс", 0),
    Investigator("Джим Кальвер", 2),
    Investigator("Диана Стэнли", 2),
    Investigator("Жаклин Файн", 2),
    Investigator("Лео Андерсон", 2),
    Investigator("Мари Ламбо", 2),
    Investigator("Марк Хэрриган", 2),
    Investigator("Рита Янг", 2),
    Investigator("Уилсон Ричардс", 2),
    Investigator("Обреченный О'Тул", 6),
    Investigator("Агнес Бейкер", 6),
    Investigator("Акачи Ониеле", 6),
    Investigator("Джордж Барнаби", 6),
    Investigator("Зои Самарас", 6),
    Investigator("Мин Ти Пан", 6),
    Investigator("Норман Уизерс", 6),
    Investigator("Патриция Хэтэуэй", 6),
    Investigator("Роланд Бэнкс", 6),
    Investigator("Сайлас Марш", 6),
    Investigator("Томми Малдун", 6),
    Investigator("Триш Скарборо", 6),
    Investigator("Уильям Йорик", 6),
    Investigator("Урсула Даунз", 6),
    Investigator("Финн Эдвардс", 6),
    Investigator("Хэнк Сэмсон", 6),
    Investigator("Венди Адамс", 4),
    Investigator("Дейзи Уокер", 4),
    Investigator("Лили Чен", 4),
    Investigator("Лола Хейес", 4),
    Investigator("Люк Робинсон", 4),
    Investigator("Рекс Мерфи", 4),
    Investigator("Тони Морган", 4),
    Investigator("Чарли Кейн", 4),
  ];

  List<Ancient> get ancients => [..._ancients];

  Ancient getAncientByName(String name) {
    return _ancients.where((element) => element.name == name).first;
  }

  List<Extension> get extensions => [..._extensions];

  List<Herald> get heralds => [..._heralds];

  List<Investigator> get investigators => [..._investigators];
  
  Investigator getInvestigatorByName(String name) {
    return _investigators.where((element) => element.name == name).first;
  }
}

class Investigator {
  String name;
  int extensionId;

  Investigator(this.name, this.extensionId);

  @override
  String toString() {
    return 'Investigator{name: $name, extensionId: $extensionId}';
  }
}

class Herald {
  String name;
  int extensionId;

  Herald(this.name, this.extensionId);

  @override
  String toString() {
    return 'Herald{name: $name, extensionId: $extensionId}';
  }
}

class Ancient {
  String name;
  int extensionId;

  Ancient(this.name, this.extensionId);

  @override
  String toString() {
    return 'Ancient{name: $name, extensionId: $extensionId}';
  }
}

class Extension {
  int id;
  String name;

  Extension(this.id, this.name);

  @override
  String toString() {
    return 'Extension{id: $id, name: $name}';
  }
}
