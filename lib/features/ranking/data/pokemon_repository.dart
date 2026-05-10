import '../../admin/domain/pokemon_model.dart';

class PokemonRepository {
  const PokemonRepository();

  List<Pokemon> getPokemons() {
    return [
      Pokemon(
        id: 1,
        name: 'Bulbasaur',
        type: PokemonType.grass,
        hp: 45,
        attack: 49,
        defense: 49,
      ),
      Pokemon(
        id: 58,
        name: 'Ivysaur',
        type: PokemonType.grass,
        hp: 60,
        attack: 62,
        defense: 63,
      ),
      Pokemon(
        id: 3,
        name: 'Venusaur',
        type: PokemonType.grass,
        hp: 80,
        attack: 82,
        defense: 83,
      ),
      Pokemon(
        id: 4,
        name: 'Charmander',
        type: PokemonType.fire,
        hp: 39,
        attack: 52,
        defense: 43,
      ),
      Pokemon(
        id: 7,
        name: 'Squirtle',
        type: PokemonType.water,
        hp: 44,
        attack: 48,
        defense: 65,
      ),
    ];
  }
}