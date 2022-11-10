import 'package:objectbox/objectbox.dart';

final List<Extension> staticExtensions = [
  Extension(1, 'База'),
  Extension(2, 'Проклятие Темного Фараона'),
  Extension(3, 'Ужас Данвича'),
  Extension(4, 'Король в Желтом'),
  Extension(5, 'Ужас Кингспорта'),
  Extension(6, 'Черная Коза Чащоб'),
  Extension(7, 'Ужас Иннсмута'),
  Extension(8, 'Затаившийся у Порога'),
  Extension(9, 'Ужас Мискатоника'),
];
final List<Ancient> staticAncients = [
  Ancient("Азатот", 1),
  Ancient("Итаква", 1),
  Ancient("Йиг", 1),
  Ancient("Йог-сотот", 1),
  Ancient("Ктулху", 1),
  Ancient("Ньярлатотеп", 1),
  Ancient("Хастур", 1),
  Ancient("Шаб-ниггурат", 1),
  Ancient("Абхот", 3),
  Ancient("Атлач-Нача", 5),
  Ancient("Бокруг", 7),
  Ancient("Глааки", 3),
  Ancient("Гхатанотоа", 7),
  Ancient("Зхар", 7),
  Ancient("И'Голонак", 5),
  Ancient("Йиб-Тстлл", 5),
  Ancient("Ктугха", 7),
  Ancient("Куахил Уттаус", 7),
  Ancient("Ньогта", 7),
  Ancient("Рхан-тегот", 7),
  Ancient("Хаугнар Фаугн", 7),
  Ancient("Цатхоггуа", 3),
  Ancient("Шудде-Мьелл", 3),
  Ancient("Эйхорт", 5),
];
final List<Herald> staticHeralds = [
  Herald("Отец Дагон", 7),
  Herald("Грот", 5),
  Herald("Затаившийся у порога", 8),
  Herald("Мать Гидра", 7),
  Herald("Черная Коза Чащоб", 6),
  Herald("Король в желтом", 4),
  Herald("Тульцча", 5),
  Herald("Темный Фараон", 2),
  Herald("Баст", 5),
  Herald("Гипнос", 5),
  Herald("Ноденс", 5),
];
final List<Investigator> staticInvestigators = [
  Investigator("Аманда Шарп", 1),
  Investigator("Боб Дженкинс", 1),
  Investigator("Винсент Ли", 1),
  Investigator("Глория Голдберг", 1),
  Investigator("Даррелл Симонс", 1),
  Investigator("Декстер Дрейк", 1),
  Investigator("Дженни Барнс", 1),
  Investigator("Джо Даймонд", 1),
  Investigator("Кейт Уинтроп", 1),
  Investigator("Кэролин Ферн", 1),
  Investigator("Майкл МакГленн", 1),
  Investigator("Монтерей Джек", 1),
  Investigator("Мэнди Томпсон", 1),
  Investigator("Пит Мусорщик", 1),
  Investigator("Сестра Мэри", 1),
  Investigator("Харви Уолтерс", 1),
  Investigator("Джим Кальвер", 3),
  Investigator("Диана Стэнли", 3),
  Investigator("Жаклин Файн", 3),
  Investigator("Лео Андерсон", 3),
  Investigator("Мари Ламбо", 3),
  Investigator("Марк Хэрриган", 3),
  Investigator("Рита Янг", 3),
  Investigator("Уилсон Ричардс", 3),
  Investigator("Обреченный О'Тул", 7),
  Investigator("Агнес Бейкер", 7),
  Investigator("Акачи Ониеле", 7),
  Investigator("Джордж Барнаби", 7),
  Investigator("Зои Самарас", 7),
  Investigator("Мин Ти Пан", 7),
  Investigator("Норман Уизерс", 7),
  Investigator("Патриция Хэтэуэй", 7),
  Investigator("Роланд Бэнкс", 7),
  Investigator("Сайлас Марш", 7),
  Investigator("Томми Малдун", 7),
  Investigator("Триш Скарборо", 7),
  Investigator("Уильям Йорик", 7),
  Investigator("Урсула Даунз", 7),
  Investigator("Финн Эдвардс", 7),
  Investigator("Хэнк Сэмсон", 7),
  Investigator("Венди Адамс", 5),
  Investigator("Дейзи Уокер", 5),
  Investigator("Лили Чен", 5),
  Investigator("Лола Хейес", 5),
  Investigator("Люк Робинсон", 5),
  Investigator("Рекс Мерфи", 5),
  Investigator("Тони Морган", 5),
  Investigator("Чарли Кейн", 5),
];

@Entity()
class Investigator {
  int id = 0;
  @Unique()
  String name;
  int extensionId;

  Investigator(this.name, this.extensionId);

  @override
  String toString() {
    return 'Investigator{name: $name, extensionId: $extensionId}';
  }
}

@Entity()
class Herald {
  int id = 0;
  @Unique()
  String name;
  int extensionId;

  Herald(this.name, this.extensionId);

  @override
  String toString() {
    return 'Herald{name: $name, extensionId: $extensionId}';
  }
}

@Entity()
class Ancient {
  int id = 0;
  @Unique()
  String name;
  int extensionId;

  Ancient(this.name, this.extensionId);

  @override
  String toString() {
    return 'Ancient{name: $name, extensionId: $extensionId}';
  }
}

@Entity()
class Extension {
  @Id(assignable: true)
  int id;
  @Unique()
  String name;

  Extension(this.id, this.name);

  @override
  String toString() {
    return 'Extension{id: $id, name: $name}';
  }
}

@Entity()
class DbVersion {
  int id = 0;
  @Property(type: PropertyType.date)
  DateTime date = DateTime.now();

  @override
  String toString() {
    return 'Extension{id: $id, date: $date}';
  }
}
