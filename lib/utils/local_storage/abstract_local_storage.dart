abstract class ILocalStorage {
  Future<void> writeData<T>(String key, T value);
  T? readData<T>(String key);
  Future<void> removeData(String key);
  Future<void> clearAll();
}
