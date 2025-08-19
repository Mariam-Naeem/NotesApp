import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/Addnote_cubit/Addnotes_cubit.dart';

class coloritem extends StatelessWidget {
  const coloritem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 38,
            child: CircleAvatar(radius: 34, backgroundColor: color),
          )
        : CircleAvatar(radius: 38, backgroundColor: color);
  }
}

class colorListView extends StatefulWidget {
  const colorListView({super.key});

  @override
  State<colorListView> createState() => _colorListViewState();
}

class _colorListViewState extends State<colorListView> {
  int currantIndex = 0;
  List<Color> colors = [
    Color(0xffAC3031),
    Color(0xffE5D352),
    Color(0xffD9E76C),
    Color(0xff537D8D),
    Color(0xff482C3D),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height: 38 * 2,
    child: ListView.builder(
      itemCount: colors.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: GestureDetector(
            onTap: () {
              currantIndex = index;
              BlocProvider.of<NotesCubit>(context).color = colors[index];
              setState(() {});
            },
            child: coloritem(
              color: colors[index],
              isActive: currantIndex == index,
            ),
          ),
        );
      },
    ),
  );
  }
}
