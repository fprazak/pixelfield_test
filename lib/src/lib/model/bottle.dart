import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottle.freezed.dart';
part 'bottle.g.dart';

@freezed
class Bottle with _$Bottle {
  const factory Bottle({
    required String name,
    required String distillery,
    required String region,
    required String country,
    required String type,
    required String ageStatement,
    required String filled,
    required String bottled,
    required String caskNumber,
    required double abv,
    required double size,
    required String finish,
    required String videoUrl,
    required String nose,
    required String palate,
  }) = _Bottle;

  factory Bottle.fromJson(Map<String, dynamic> json) => _$BottleFromJson(json);
}
