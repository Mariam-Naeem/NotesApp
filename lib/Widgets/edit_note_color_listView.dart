import 'package:flutter/material.dart';
import 'package:notes/Widgets/color_list_view.dart';
import 'package:notes/constants.dart';
import 'package:notes/models/note_model.dart';

class editnotecolorlist extends StatefulWidget {
  const editnotecolorlist({super.key, required this.note});
  final NoteModel note;
  @override
  State<editnotecolorlist> createState() => _editnotecolorlistState();
}

class _editnotecolorlistState extends State<editnotecolorlist> {
  late int currantIndex;
  @override
  void initState() {
    currantIndex = kcolors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: kcolors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currantIndex = index;
                widget.note.color = kcolors[index].value;
                setState(() {});
              },
              child: coloritem(
                color: kcolors[index],
                isActive: currantIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
