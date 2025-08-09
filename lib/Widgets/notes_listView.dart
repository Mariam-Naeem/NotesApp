import 'package:flutter/material.dart';
import 'package:notes/Widgets/custom_note_item.dart';

class NodesListView extends StatelessWidget {
   NodesListView({super.key});
  var data = const [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: const NoteItem(),
          );
        },
      ),
    );
  }
}
