// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Downloads _$$_DownloadsFromJson(Map<String, dynamic> json) => _$_Downloads(
      posterPath: json['poster_path'] as String?,
      title: json['original_title'] as String?,
      title2: json['name'] as String?,
      backImg: json['backdrop_path'] as String?,
    );

Map<String, dynamic> _$$_DownloadsToJson(_$_Downloads instance) =>
    <String, dynamic>{
      'poster_path': instance.posterPath,
      'original_title': instance.title,
      'name': instance.title2,
      'backdrop_path': instance.backImg,
    };
