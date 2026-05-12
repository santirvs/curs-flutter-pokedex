import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:my_pokedex/features/admin/presentation/admin_screen.dart';
import 'package:my_pokedex/features/home/presentation/home_screen.dart';

import 'loading_screen_controller.dart';

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

Widget _defaultNextScreen(BuildContext context) =>
    kIsWeb ? const AdminScreen() : const HomeScreen();

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({
    super.key,
    this.minimumDisplayDuration = Duration.zero,
    this.readiness,
    this.nextScreenBuilder = _defaultNextScreen,
  });

  final Duration minimumDisplayDuration;

  final Future<void>? readiness;

  final WidgetBuilder nextScreenBuilder;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  final _logic = LoadingScreenController();
  Timer? _tipTimer;

  late final _intro = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 3200),
  );
  late final _spin = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat();
  late final _bob = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat();

  late final _bgReveal = CurvedAnimation(
    parent: _intro,
    curve: const Interval(0, 0.55, curve: Curves.easeOutCubic),
  );
  late final _uiReveal = CurvedAnimation(
    parent: _intro,
    curve: const Interval(0.38, 1, curve: Curves.easeOutCubic),
  );

  @override
  void initState() {
    super.initState();
    _runSequence();
  }

  Future<void> _runSequence() async {
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

    await _intro.forward();
    if (!mounted) return;
    setState(_logic.enterLoop);

    _tipTimer = Timer.periodic(LoadingScreenController.tipRotationInterval, (
      _,
    ) {
      if (!mounted) return;
      setState(_logic.advanceTip);
    });

    await Future.wait<void>([
      Future<void>.delayed(widget.minimumDisplayDuration),
      widget.readiness ?? Future<void>.value(),
    ]);
    if (!mounted) return;

    _tipTimer?.cancel();
    _tipTimer = null;
    _spin.stop();
    _bob.stop();
    setState(_logic.enterOutro);

    await Future<void>.delayed(
      LoadingScreenController.outroPauseBeforeNavigate,
    );
    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: widget.nextScreenBuilder),
    );
  }

  @override
  void dispose() {
    _tipTimer?.cancel();
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
              const _Background(),
              Positioned.fill(
                child: ColoredBox(
                  color: Colors.white.withValues(alpha: 1 - bg),
                ),
              ),
              SafeArea(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _CenterBlock(
                      reveal: ui,
                      spin: _spin.value,
                      bob: _bob.value,
                      tip: _logic.currentTip,
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 80,
                      height: 300,
                      child: AnimatedOpacity(
                        opacity: _logic.phase == LoadingPhase.intro ? 0 : 1,
                        duration: const Duration(milliseconds: 320),
                        child: _OakArt(
                          outro: _logic.phase == LoadingPhase.outro,
                        ),
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

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) => const DecoratedBox(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF283593), Color(0xFF0D1642), Color(0xFF070B1A)],
      ),
    ),
    child: SizedBox.expand(),
  );
}

class _OakArt extends StatelessWidget {
  const _OakArt({required this.outro});
  final bool outro;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: outro ? 780 : 420),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        child: Image.asset(
          outro ? 'assets/images/oak_2.webp' : 'assets/images/oak.png',
          key: ValueKey<bool>(outro),
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
                        'assets/images/pokeball.png',
                        width: 88,
                        height: 88,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'CARREGANT...',
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
