abstract class StorageBase {
  Future<void> init();

  T? read<T>(String key);

  Map readAll();

  void write(String key, dynamic value);

  void delete(String key);

  void clear();

  void deleteStorage();
}
