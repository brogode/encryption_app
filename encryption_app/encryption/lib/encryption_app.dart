import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'dart:math';
import 'dart:convert';

class FileEncryption {
  void encryptFile(String inputFile, String outputFile, String keyString, String ivString) {
    final key = Key.fromUtf8(keyString);
    final iv = IV.fromUtf8(ivString);
    final encrypter = Encrypter(AES(key));

    final inputFileBytes = File(inputFile).readAsBytesSync();
    final encryptedBytes = encrypter.encryptBytes(inputFileBytes, iv: iv).bytes;

    File(outputFile).writeAsBytesSync(encryptedBytes);
  }

  void decryptFile(String inputFile, String outputFile, String keyString, String ivString) {
    final key = Key.fromUtf8(keyString);
    final iv = IV.fromUtf8(ivString);
    final encrypter = Encrypter(AES(key));

    final inputFileBytes = File(inputFile).readAsBytesSync();
    final decryptedBytes = encrypter.decryptBytes(Encrypted(inputFileBytes), iv: iv);

    File(outputFile).writeAsBytesSync(decryptedBytes);
  }
}

class FileCreation {
  void createFile(String filename,String filedata) {
    final inputFile = '$filename.txt';
    final data = filedata;
    File(inputFile).writeAsStringSync(data);
  }
}

class keygenarater{
  String generateRandomKey() {
    final random = Random.secure();
    final length = 16; // Key length in bytes
    final keyBytes = List<int>.generate(length, (_) => random.nextInt(256));
    final key = base64Url.encode(keyBytes);
    return key;
  }

}

void main() {
  final fileEncryption = FileEncryption();
  final fileCreation = FileCreation();

  final encryptedFile = 'encrypted.txt';
  final decryptedFile = 'decrypted.txt';
  final keyString = 'abcdefghijklmnop';
  final ivString = 'qrstuvwxzy123456';
  final inputFile = 'input';

  fileCreation.createFile(inputFile, 'this is a test');

  // Encrypt the test file
  fileEncryption.encryptFile(inputFile, encryptedFile, keyString, ivString);

  // Decrypt the encrypted file
  fileEncryption.decryptFile(encryptedFile, decryptedFile, keyString, ivString);
}
