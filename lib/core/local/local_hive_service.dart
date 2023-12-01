import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pp;


class LocalDatabaseHiveService {
  static String? _path;

  static String get path {
    if (_path != null) {
      return _path!;
    } else {
      throw Exception('Path not initialized');
    }
  }

  static Future<void> init() async {
    final dir = await pp.getApplicationDocumentsDirectory();
    _path = dir.path;
    Hive.init(_path);
   
  }

  LocalDatabaseHiveService._();
}
