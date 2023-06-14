import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

class FileEncryption {
// Encrypts a file using AES with the provided key and IV
void encryptFile(String inputFile, String outputFile, String keyString, String ivString) {
  final key = Key.fromUtf8(keyString);
  final iv = IV.fromUtf8(ivString);
  final encrypter = Encrypter(AES(key));

  final inputFileBytes = File(inputFile).readAsBytesSync();
  final encryptedBytes = encrypter.encryptBytes(inputFileBytes, iv: iv).bytes;

  File(outputFile).writeAsBytesSync(encryptedBytes);
}

// Decrypts a file using AES with the provided key and IV
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
void filecreation(String name){
  final inputFile = 'input.txt';
  final data = 'This is a test file';
  File(inputFile).writeAsStringSync(data);
  }}
void main() {
  final FileEncryptio = FileEncryption();
  
  final encryptedFile = 'encrypted.txt';
  final decryptedFile = 'decrypted.txt';
  final keyString = 'abcdefghijklmnop';
  final ivString = 'qrstuvwxzy123456';
  final inputFile = 'input.txt';
  final data = 'This is a test file';
  File(inputFile).writeAsStringSync(data);
  // Create a test file with some data
  

  // Encrypt the test file
  FileEncryptio.encryptFile(inputFile, encryptedFile, keyString, ivString);

  // Decrypt the encrypted file
  FileEncryptio.decryptFile(encryptedFile, decryptedFile, keyString, ivString);

}  