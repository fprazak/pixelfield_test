// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BottleImpl _$$BottleImplFromJson(Map<String, dynamic> json) => _$BottleImpl(
      name: json['name'] as String,
      distillery: json['distillery'] as String,
      region: json['region'] as String,
      country: json['country'] as String,
      type: json['type'] as String,
      ageStatement: json['ageStatement'] as String,
      filled: json['filled'] as String,
      bottled: json['bottled'] as String,
      caskNumber: json['caskNumber'] as String,
      abv: (json['abv'] as num).toDouble(),
      size: (json['size'] as num).toDouble(),
      finish: json['finish'] as String,
      videoUrl: json['videoUrl'] as String,
      nose: json['nose'] as String,
      palate: json['palate'] as String,
    );

Map<String, dynamic> _$$BottleImplToJson(_$BottleImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'distillery': instance.distillery,
      'region': instance.region,
      'country': instance.country,
      'type': instance.type,
      'ageStatement': instance.ageStatement,
      'filled': instance.filled,
      'bottled': instance.bottled,
      'caskNumber': instance.caskNumber,
      'abv': instance.abv,
      'size': instance.size,
      'finish': instance.finish,
      'videoUrl': instance.videoUrl,
      'nose': instance.nose,
      'palate': instance.palate,
    };
