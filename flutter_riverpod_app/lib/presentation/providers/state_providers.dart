import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app/config/config.dart';

final counterProvider = StateProvider<int>((ref) {
  return 5;
});

final darkModeProvider = StateProvider<bool>((ref) {
  return false;
});

final randomNameProvider = StateProvider<String>((ref) {
  return RandomGenerator.getRandomName();
});