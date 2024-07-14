import 'package:hive/hive.dart';


part 'hivecardsdatamodel.dart';

@HiveType(typeId: 0) 
class SavedCardsModel {
  @HiveField(0)
 late int id;
  @HiveField(0)

 late String name;
  @HiveField(1)

 late String type;
  @HiveField(2)

 late String frameType;
  @HiveField(3)
 late String desc;
  @HiveField(4)

 late int atk;
  @HiveField(5)

 late int def;
  @HiveField(6)

 late int level;
  @HiveField(7)

 late String race;
  @HiveField(8)

 late String attribute;
  @HiveField(9)

 late List cardSets;
  @HiveField(10)

 late List cardImages;
  @HiveField(11)

 late List cardPrices;

  SavedCardsModel(
      {required this.id,
     required this.name,
     required this.type,
     required this.frameType,
     required this.desc,
     required this.atk,
     required this.def,
     required this.level,
     required this.race,
     required this.attribute,
     required this.cardSets,
     required this.cardImages,
     required this.cardPrices});
}