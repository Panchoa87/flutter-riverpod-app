import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app/config/config.dart';

final pokemonNameProvider = FutureProvider<String>((ref) async {

  final pokemonId = ref.watch(pokemonIdProvider);
  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);
  return pokemonName;
  // final pokemonName = await PokemonInformation.getPokemonName(1);
  // return pokemonName;
});

final pokemonIdProvider = StateProvider<int>((ref) {
  return 1;
});

final pokemonProvider = FutureProvider.family<String,int >((ref, pokemonId) async {
  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);
  return pokemonName;
});