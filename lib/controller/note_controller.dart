import 'package:dating_note/database/service_db.dart';
import 'package:dating_note/model/note_model.dart';

class NoteController{
  final service = ServiceDatabase();
  Future<void> insertData(NoteModel model) async{
     final db = await service.initializeData();
    await db.insert(service.table, model.fromJson());
  }

  Future<List<NoteModel>> getData() async {
    final db = await service.initializeData();
    List<Map<String, dynamic>> result = await db.query(service.table);
    return result.map((e) => NoteModel.toJson(e)).toList();
  }

  Future<void> updateData(NoteModel model) async {
    final db = await service.initializeData();
    await db.update(service.table, model.fromJson(),
        where: 'id=?', whereArgs: [model.id]);
  }

  Future<void> deleteData(int id) async {
    final db = await service.initializeData();
    await db.delete(service.table, where: 'id=?', whereArgs: [id]);
  }
}