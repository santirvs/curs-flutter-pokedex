import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_model.freezed.dart';
part 'pokemon_model.g.dart';

enum PokemonType {
  normal('Normal'),
  fire('Foc'),
  water('Aigua'),
  electric('Elèctric'),
  grass('Planta'),
  ice('Gel'),
  fighting('Lluita'),
  poison('Verí'),
  ground('Terra'),
  flying('Vol'),
  psychic('Psíquic'),
  bug('Insecte'),
  rock('Roca'),
  ghost('Fantasma'),
  dragon('Drac'),
  dark('Fosc'),
  steel('Acer'),
  fairy('Fada');

  const PokemonType(this.label);

  final String label;

  static PokemonType fromPokeApiName(String name) {
    try {
      return PokemonType.values.byName(name);
    } on ArgumentError {
      return PokemonType.normal;
    }
  }
}

@freezed
abstract class Pokemon with _$Pokemon {
  const factory Pokemon({
    required int id,
    required String name,
    required PokemonType type,
    required int hp,
    required int attack,
    required int defense,
    String? imageUrl,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}
