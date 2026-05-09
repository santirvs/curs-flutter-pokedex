import 'package:pokedex/myApp/admin/domain/troop_model.dart';

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
}

class Pokemon {
  const Pokemon({
    required this.id,
    required this.name,
    required this.type,
    required this.hp,
    required this.attack,
    required this.defense,
    this.imageUrl,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json['id'] as int,
        name: json['name'] as String,
        type: TroopMovementType.values.byName(json['type'] as String),
        hp: json['hp'] as int,
        attack: json['attack'] as int,
        defense: json['defense'] as int,
        imageUrl: json['imageUrl'] as String?,
      );

  final int id;
  final String name;
  final TroopMovementType type;
  final int hp;
  final int attack;
  final int defense;

  final String? imageUrl;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type.name,
        'hp': hp,
        'attack': attack,
        'defense': defense,
        'imageUrl': imageUrl,
      };
}
