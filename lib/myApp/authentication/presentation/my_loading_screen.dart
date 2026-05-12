import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:my_pokedex/features/admin/presentation/admin_screen.dart';
import 'package:my_pokedex/myApp/home/presentation/my_home_screen.dart';


// Defineix uns estils amb el tipus de lletra
/*
const _titleStyle = TextStyle(
  fontFamily: 'PokemonGb',
  fontSize: 13,
  height: 1.4,
  color: Color(0xFFE8EAF6),
  letterSpacing: 0.5,
);

const _tipStyle = TextStyle(
  fontFamily: 'PokemonGb',
  fontSize: 11,
  height: 1.35,
  color: Color(0xFFB0BEC5),
);
*/

const _titleStyle = TextStyle(
  fontFamily: 'CoC',
  fontSize: 17,
  height: 1.4,
  color: Color(0xFFE8EAF6),
  letterSpacing: 0.5,
);
const _tipStyle = TextStyle(
  fontFamily: 'CoC',
  fontSize: 11,
  height: 1.35,
  color: Color(0xFFB0BEC5),
);

// Decideix quina serà la propera pantalla:  "Home" en mòbil i restringida a "Admin" si estem en web
Widget _defaultNextScreen(BuildContext context) =>
    kIsWeb ? const AdminScreen() : const MyHomeScreen();

class MyLoadingScreen extends StatefulWidget {
  const MyLoadingScreen({
    super.key,
    this.minimumDisplayDuration = const Duration(milliseconds: 3000),
    this.readiness,
    this.nextScreenBuilder = _defaultNextScreen,
  });

  final Duration minimumDisplayDuration;

  final Future<void>? readiness;

  final WidgetBuilder nextScreenBuilder;

  @override
  State<MyLoadingScreen> createState() => _MyLoadingScreenState();
}

class _MyLoadingScreenState extends State<MyLoadingScreen>
    with TickerProviderStateMixin {

  late final _intro = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 5000),   
  );


  late final _spin = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 3200),
  );//..repeat();  //Trec el repeat per tal que el faci només una vegada


  //Efecto "rebote"
  late final _bob = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
  )..repeat();

  // backgroundReveal:: fa fade-in
  late final _bgReveal = CurvedAnimation(
    parent: _intro,
    curve: const Interval(0, 0.55, curve: Curves.easeOutCubic),
  );

  late final _uiReveal = CurvedAnimation(
    parent: _intro,
    curve: const Interval(0.38, 1, curve: Curves.easeOutCubic),
  );

  late double opacityLogo = 0;

  @override
  void initState() {
    super.initState();
    _runSequence();
  }

  Future<void> _runSequence() async {
    //Se salta l'animació si estem en una web o bé el temps d'animació és zero
    final skipAnimation = kIsWeb ||
        (widget.readiness == null &&
            widget.minimumDisplayDuration <= Duration.zero);

    if (skipAnimation) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(builder: widget.nextScreenBuilder),
        );
      });
      return;
    }

    // Comencem a fer-los girar perque apareguin girant
    _spin.forward(); // El gigante empieza a girar (una sóla vez al usar el forward y no el repeat)
  
    //Comença l'animació
    await _intro.forward();
    if (!mounted) return;

    opacityLogo = 1;
    _bob.repeat(reverse: true); // El gigante empieza a flotar arriba y abajo

    await Future.wait<void>([
      Future<void>.delayed(widget.minimumDisplayDuration),
      widget.readiness ?? Future<void>.value(),
    ]);
    if (!mounted) return;

    _spin.stop();
    _bob.stop();

    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: widget.nextScreenBuilder),
    );
  }

  @override
  void dispose() {
    _intro.dispose();
    _spin.dispose();
    _bob.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: Listenable.merge([_intro, _spin, _bob]),
        builder: (context, _) {
          final bg = _bgReveal.value;
          final ui = _uiReveal.value;
          return Stack(
            fit: StackFit.expand,
            children: [
              //Posa un background 
              const _Background(),


              //Posa una caixa blanca i la va fent transparent per crear un efecte d'aparició (fade-in)              
              Positioned.fill(
                child: ColoredBox(
                  color: Colors.white.withValues(alpha: 1 - bg),
                ),
              ),
              
              

              //Area de l'Splash
              
              SafeArea(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _CenterBlock(
                      reveal: ui,
                      spin: _spin.value,
                      bob: _bob.value,
                      tip: "Carregant els personatges...",
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 80,
                      height: 300,
                      child: AnimatedOpacity(
                        opacity: opacityLogo,
                        duration: const Duration(milliseconds: 320),
                        child: _MostrarLogo(),
                      ),
                    ),
                  ],
                ),
              ),
              
            ],
          );
        },
      ),
    );
  }
}




// Crea un caixa que fa de fons (background) 
// amb un gradient que va del primer color (a dalt), passant pel segon color (al mig) i arribant al tercer color (a baix)
class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) => const DecoratedBox(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        //colors: [Color(0xFF283593), Color(0xFF0D1642), Color(0xFF070B1A)],
        colors: [Color(0xFFFFFFFF), Color(0xFF000000), Color(0xFFFF0000)],
      ),
    ),
    child: SizedBox.expand(),
  );
}




// Mostra el logo
class _MostrarLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 780),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        child: Image.asset(
          'assets/images/MyApp/clash_of_clans_logo.png',
          height: 240,
          fit: BoxFit.contain,
          alignment: Alignment.topCenter,
          filterQuality: FilterQuality.medium,
        ),
      ),
    );
  }
}

class _CenterBlock extends StatelessWidget {
  const _CenterBlock({
    required this.reveal,
    required this.spin,
    required this.bob,
    required this.tip,
  });

  final double reveal;
  final double spin;
  final double bob;
  final String tip;

  @override
  Widget build(BuildContext context) {
    final bobY = 10 * math.sin(bob * 2 * math.pi);
    return Align(
      alignment: const Alignment(0, 0.3),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Opacity(
          opacity: reveal,
          child: Transform.translate(
            offset: Offset(0, 12 * (1 - reveal)),
            child: Transform.scale(
              scale: 0.88 + 0.12 * reveal,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.translate(
                    offset: Offset(0, bobY),
                    child: Transform.rotate(
                      angle: spin * 2 * math.pi,
                      child: Image.asset(
                        'assets/images/MyApp/gigante.png',
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'Carregant Clash of Clans...',
                    style: _titleStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: 320,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 520),
                      child: Text(
                        tip,
                        key: ValueKey<String>(tip),
                        style: _tipStyle,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
