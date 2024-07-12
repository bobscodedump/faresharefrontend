import 'dart:convert';

import '../models/all_groups.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_provider.g.dart';

@riverpod
Future<List<Group>> getUserGroups(GetUserGroupsRef ref) async {
  final response =
      await http.get(Uri.https("http://localhost:5250", "/api/v1/group/all"));
  final List<dynamic> groups = jsonDecode(response.body);
  return groups.map((group) => Group.fromJson(group)).toList();
}
