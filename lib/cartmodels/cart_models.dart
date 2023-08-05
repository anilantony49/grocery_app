import 'package:hive_flutter/adapters.dart';

part 'cart_models.g.dart';

@HiveType(typeId: 1)
class CartModels {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final bool isDeleted;
  @HiveField(3)
  final String image;

  CartModels(
      {required this.id,
      required this.image,
      this.isDeleted = false,
      required this.title});
}
