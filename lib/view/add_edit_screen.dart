import 'dart:math';

import 'package:flutter/material.dart';

import '../controller/note_controller.dart';
import '../model/note_model.dart';
import '../widget/color_list.dart';
import '../widget/field_add.dart';
import 'home_screen.dart';

// ignore: must_be_immutable
class AddEditScreen extends StatefulWidget {
  AddEditScreen({super.key, this.noteModel});
  late NoteModel? noteModel;
  @override
  State<AddEditScreen> createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  final title = TextEditingController();

  final description = TextEditingController();

  final time = DateTime.now();

  reloadData() {
    title.text = widget.noteModel!.title;
    description.text = widget.noteModel!.description;
  }

  @override
  void initState() {
    widget.noteModel == null ? '' : reloadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: iconColor,
            )),
        backgroundColor: bgColor,
        title: Text(
          widget.noteModel == null ? 'Add note' : 'Edit note',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              widget.noteModel == null
                  ? await NoteController()
                      .insertData(
                        NoteModel(
                          id: Random().nextInt(1000),
                          title: title.text,
                          description: description.text,
                          time: '${time.year}-${time.month}-${time.day}',
                        ),
                      )
                      .whenComplete(() => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                          (route) => false))
                  : await NoteController()
                      .updateData(
                        NoteModel(
                          id: widget.noteModel!.id,
                          title: title.text,
                          description: description.text,
                          time: '${time.year}-${time.month}-${time.day}',
                        ),
                      )
                      .whenComplete(() => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                          (route) => false));
            },
            icon: const Icon(
              Icons.save,
              color: iconColor,
              size: 28,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FieldAdd(
              controller: title,
              hintText: 'note title',
              maxLines: 1,
            ),
            SizedBox(height: 10),
            FieldAdd(
              controller: description,
              hintText: 'note description',
              maxLines: 10,
            ),
          ],
        ),
      ),
    );
  }
}
