import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namer_app/src/models/all_groups.dart';
import 'package:namer_app/src/services/group_provider.dart';
import 'package:namer_app/src/widgets/list_card.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final AsyncValue<List<Group>> groups = ref.watch(getUserGroupsProvider);
        return SafeArea(
            child: switch (groups) {
          AsyncData(:final value) => ListView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) {
                final group = value[index];
                return ListCard(
                  icon: Icons.group,
                  title: group.title,
                  amount: 0.0,
                );
              }),
          AsyncError() => const Text('Oops, something unexpected happened'),
          _ => const CircularProgressIndicator(),
        });
      },
    );
  }
}
