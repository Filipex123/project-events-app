import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorageService {
  static const storage = FlutterSecureStorage();
  static const keyName = 'accessToken';

  static Future<void> store(String token) async {
    await storage.write(key: keyName, value: token);
  }

  static Future<String?> read() async {
    return storage.read(key: keyName);
  }

  static Future<void> clear() async {
    await storage.delete(key: keyName);
  }
}
