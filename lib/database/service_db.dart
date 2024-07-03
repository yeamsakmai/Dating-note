// import 'dart:io';

// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqlite_api.dart';
// import 'package:path/path.dart';

// class ServiceDatabase {
//   final String = 'tbl_note';
//   Future<Database> initializeData() async {
//     Directory tempDir = await getTemporaryDirectory();
//     String tempPath = tempDir.path;
//     Directory appDir = await getApplicationDocumentsDirectory();
//     String appPath = appDir.path;
//     String path = await getDatabasesPath();
//     return openDatabase(
//       join(path, 'note.db'),
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute(
//             'CREATE TABLE $table(id INTEGER PRIMARY KEY,title TEXT,description TEXT,time TEXT)');
//       },
//     );
//   }
// }
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class ServiceDatabase {
  final String table = 'tbl_note';
  Future<Database> initializeData() async {
    Directory tempDir = await getTemporaryDirectory();
    // ignore: unused_local_variable
    String tempPath = tempDir.path;
    Directory appDir = await getApplicationDocumentsDirectory();
    // ignore: unused_local_variable
    String appPath = appDir.path;
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'note.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE $table(id INTEGER PRIMARY KEY,title TEXT,description TEXT,time TEXT)');
      },
    );
  }
}