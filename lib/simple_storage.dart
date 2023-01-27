import 'package:hive/hive.dart';

class SimpleStorage {
  final String path;

  SimpleStorage(this.path);

  Box? _storage;

  Future<void> init() async {
    _storage = await Hive.openBox('storage', path: path);
  }

  T? read<T>(String key) {
    return _storage?.get(key) as T?;
  }

  Map readAll() {
    Map values = {};
    if (_storage != null) {
      final keysLength = _storage!.keys.length;

      for (int i = 0; i < keysLength; i++) {
        values.addAll({
          _storage!.keys.elementAt(i): _storage!.values.elementAt(i),
        });
      }
    }

    return values;
  }

  void write(String key, dynamic value) {
    _storage?.put(key, value);
  }

  void delete(String key) {
    _storage?.delete(key);
  }

  void clear() {
    _storage?.clear();
  }

  void deleteStorage() {
    _storage?.deleteFromDisk();
  }
}
