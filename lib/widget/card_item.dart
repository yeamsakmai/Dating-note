import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../controller/note_controller.dart';
import '../model/note_model.dart';
import '../view/add_edit_screen.dart';
import '../view/home_screen.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.model});
  final NoteModel model;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(10),
            onPressed: (context) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditScreen(noteModel: model),
                ),
              );
            },
            backgroundColor: const Color.fromARGB(255, 8, 247, 16),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
          SlidableAction(
            borderRadius: BorderRadius.circular(10),
            onPressed: (context) async {
              await NoteController()
                  .deleteData(model.id)
                  .whenComplete(() => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                      (route) => false));
            },
            backgroundColor: const Color.fromARGB(255, 241, 35, 20),
            foregroundColor: Colors.white,
            icon: Icons.delete_forever,
            label: 'Delete',
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: Colors.grey[100],
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(model.description),
                Text(model.time),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
