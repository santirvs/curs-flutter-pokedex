import '../../admin/domain/troop_model.dart';

class TroopRepository {
  const TroopRepository();

  List<Troop> getTroops() {
     return TroopType.values.map((type) {
      return Troop(
        id: type.index, // Usa el índice del enum como ID único
        name: type.name,
        level: type.level,
        life: type.life,
        damage: type.damage,
        range: type.range,
        imageUrl: type.imageFile,
        movement: type.movement // Usa el getter que ya se ha creado en el enum
      );
    }).toList();
  }
}
