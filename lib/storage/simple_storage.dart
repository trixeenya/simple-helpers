import 'package:collection/collection.dart';
import 'package:hive/hive.dart';
import 'package:simple_helpers/storage/storage_base.dart';

const _defaultBox = 'default';

class SimpleStorage implements StorageBase {
  final String path;

  SimpleStorage(this.path);

  late Box box;

  @override
  Future<void> init() async {
    box = await Hive.openBox(_defaultBox, path: path);
  }

  @override
  void clear() => box.clear();

  @override
  void delete(String key) => box.delete(key);

  @override
  void deleteStorage() => box.deleteFromDisk();

  @override
  T? read<T>(String key) => box.get(key) as T?;

  @override
  Map readAll() {
    throw UnimplementedError();
  }

  @override
  void write(String key, value) => box.put(key, value);
}
