import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_groups.freezed.dart';
part 'all_groups.g.dart';

@freezed
class Group with _$Group {
  factory Group({
    required String id,
    required String title,
    required String description,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}
