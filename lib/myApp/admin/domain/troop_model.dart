import 'package:flutter/material.dart';

enum TroopType { 
  land('Terrestre', Color(0xFFFFF3E0)),
  air('Aeri',Color.fromARGB(255, 192, 198, 245)),
  defense('Defensiu', Color.fromARGB(255, 230, 99, 66)),
  hero('Heroi',Color.fromARGB(255, 81, 76, 235)),
  building('Edifici',Color.fromARGB(255, 168, 217, 164)),
  spell('Encanteri',Color.fromARGB(255, 207, 52, 176)),
  ;

  final String label;
  final Color? color;
  
    //Constructor constante
  const TroopType(this.label, this.color);
  
   }

enum OfficialTroop {
  reinaArquera('Reina Arquera', 50, 1606, 456, 5, 'archer_queen.png', TroopType.land),
  arquera('Arquera', 7, 48, 25, 3.5, 'arquera.png', TroopType.land),
  barbaro('Bàrbar', 7, 160, 30, 0.4, 'barbaro.png', TroopType.land),
  bruja('Bruixa', 4, 470, 165, 4, 'bruja.png', TroopType.land),
  constructor('Constructor', 5, 0, 0, 0, 'constructor.png', TroopType.building),
  dragon('Drac', 6, 3400, 270, 4.5, 'dragon.png', TroopType.air),
  esbirro('Esbirro', 7, 90, 58, 1.3, 'esbirro.png', TroopType.air),
  esqueleto('Trencamurs', 6, 72, 55, 0.5, 'esqueleto.png', TroopType.land),
  gigante('Gegant', 7, 1300, 77, 1, 'gigante.png', TroopType.land),
  globo('Globus', 7, 690, 198, 5, 'globo.png', TroopType.air),
  golem('Golem', 6, 6600, 60, 1, 'golem.png', TroopType.land),
  granCentinela('Gran Centinel·la', 20, 1275, 94, 7, 'gran_centinela.png', TroopType.air),
  mago('Mag', 8, 210, 215, 3, 'mago.png', TroopType.land),
  montapuercos('Hog rider', 7, 700, 140, 0.6, 'montapuercos.png', TroopType.land),
  pekka('P.E.K.K.A.', 7, 5900, 540, 0.8, 'pekka.png', TroopType.land),
  reyBarbaro('Rei Bàrbar', 48, 4611, 270, 1, 'rey_barbaro.png', TroopType.land),
  valkiria('Valkiria', 5, 1300, 148, 0.5, 'valkiria.png', TroopType.land) ;

  final String name;
  final int level;
  final int life;
  final int damage;
  final double range;
  final String imageUrl;
  final TroopType movement;

  //Constructor constante
  const OfficialTroop(this.name, this.level, this.life, this.damage, this.range, this.imageUrl, this.movement);

  //Métodos personalizados
  String get imageFile => 'assets/images/MyApp/$imageUrl';

}

class Troop {
  const Troop({
    required this.id,
    required this.name,
    required this.level,
    required this.life,
    required this.damage,
    required this.range,
    required this.type,
    this.imageUrl,
  });

  factory Troop.fromJson(Map<String, dynamic> json) => Troop(
        id: json['id'] as int,
        name: json['name'] as String,
        level: json['level'] as int,
        life: json['life'] as int,
        damage: json['damage'] as int,
        range: json['range'] as double,
        imageUrl: json['imageUrl'] as String?,
        type: json['movement'] as TroopType
      );

  final int id;
  final String name;
  final int level;
  final int life;
  final int damage;
  final double range;
  final String? imageUrl;
  final TroopType type;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'level': level,
        'life': life,
        'damage': damage,
        'range': range,
        'imageUrl': imageUrl,
        'movement' : type.name,
      };
}
