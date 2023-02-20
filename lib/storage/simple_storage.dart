import 'package:collection/collection.dart';
import 'package:hive/hive.dart';
import 'package:simple_helpers/storage/storage_base.dart';

const _registeredBoxes = 'registered_boxes';
const _defaultBox = 'default';

class SimpleStorage implements StorageBase {
  final String path;

  SimpleStorage(this.path);

  late Box box;

  final List<Box> _storageBoxes = [];

  List<Box> get storageBoxes => _storageBoxes;

  @override
  Future<void> init() async {
    // box = await registerBox(_defaultBox);
    box = await Hive.openBox(_defaultBox, path: path);
    _storageBoxes.add(box);

    if (read(_registeredBoxes) == null) {
      write(_registeredBoxes, []);
    }

    for (var name in read(_registeredBoxes)) {
      await registerBox(name);
    }
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

  Box? getBoxByName(String name) {
    final cachedBox =
        _storageBoxes.firstWhereOrNull((element) => element.name == name);

    if (cachedBox != null) {
      return cachedBox;
    } else {
      Box? cacheBox;
      Box? returnBox;
      registerBox(name)
          .then((box) => cacheBox = box)
          .whenComplete(() => returnBox = cacheBox);
      return returnBox;
    }
  }

  // void setBox(String name) {
  //   final cachedBox =
  //       _storageBoxes.firstWhereOrNull((element) => element.name == name);
  //   if (cachedBox != null) {
  //     box = cachedBox;
  //   } else {
  //     throw Exception('This box is not registered, try register it first');
  //   }
  // }

  Future<Box> registerBox(String name) async {
    final box = await Hive.openBox(name, path: path);

    if (_storageBoxes.contains(box)) return box;

    _storageBoxes.add(box);
    _refreshRegisteredBoxes();

    return box;
  }

  void _refreshRegisteredBoxes() {
    write(_registeredBoxes, _storageBoxes.map((e) => e.name).toList());
  }
}
