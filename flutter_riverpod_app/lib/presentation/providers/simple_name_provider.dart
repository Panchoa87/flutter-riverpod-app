import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app/config/config.dart';

final simpleNameProvider = Provider.autoDispose<String>((ref) {
  return RandomGenerator.getRandomName();
});