import '../data/pokemon_repository.dart';
import '../../admin/domain/pokemon_model.dart';

class RankingScreenController {
  RankingScreenController();

  List<Pokemon> getPokemons() {
    return const PokemonRepository().getPokemons();
  }
}