// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Pokemon _$PokemonFromJson(Map<String, dynamic> json) => _Pokemon(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  type: $enumDecode(_$PokemonTypeEnumMap, json['type']),
  hp: (json['hp'] as num).toInt(),
  attack: (json['attack'] as num).toInt(),
  defense: (json['defense'] as num).toInt(),
  imageUrl: json['imageUrl'] as String?,
);

Map<String, dynamic> _$PokemonToJson(_Pokemon instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': _$PokemonTypeEnumMap[instance.type]!,
  'hp': instance.hp,
  'attack': instance.attack,
  'defense': instance.defense,
  'imageUrl': instance.imageUrl,
};

const _$PokemonTypeEnumMap = {
  PokemonType.normal: 'normal',
  PokemonType.fire: 'fire',
  PokemonType.water: 'water',
  PokemonType.electric: 'electric',
  PokemonType.grass: 'grass',
  PokemonType.ice: 'ice',
  PokemonType.fighting: 'fighting',
  PokemonType.poison: 'poison',
  PokemonType.ground: 'ground',
  PokemonType.flying: 'flying',
  PokemonType.psychic: 'psychic',
  PokemonType.bug: 'bug',
  PokemonType.rock: 'rock',
  PokemonType.ghost: 'ghost',
  PokemonType.dragon: 'dragon',
  PokemonType.dark: 'dark',
  PokemonType.steel: 'steel',
  PokemonType.fairy: 'fairy',
};
