enum LoadingPhase { intro, loop, outro }

const _kDefaultTips = <String>[
  'Col.locant el Pokemon dins la Ball...',
  'Si la ball rebota molt, esta pensant!',
  'Oak encara busca la contrassenya del WiFi.',
  'Magikarp usa Splash! ... contra la latencia.',
  'Cubchoo es el refredat de la cache.',
];

class MyLoadingScreenController {
  factory MyLoadingScreenController({List<String>? tips}) {
    final resolved = tips ?? _kDefaultTips;
    if (resolved.isEmpty) {
      throw ArgumentError('tips no pot ser buit');
    }
    return MyLoadingScreenController._(List<String>.unmodifiable(resolved));
  }

  MyLoadingScreenController._(this._tips);

  final List<String> _tips;

  static const tipRotationInterval = Duration(milliseconds: 4200);
  static const outroPauseBeforeNavigate = Duration.zero;

  LoadingPhase phase = LoadingPhase.intro;
  int _tipIndex = 0;

  String get currentTip => _tips[_tipIndex];

  void enterLoop() {
    phase = LoadingPhase.loop;
  }

  void enterOutro() {
    phase = LoadingPhase.outro;
  }

  void advanceTip() {
    _tipIndex = (_tipIndex + 1) % _tips.length;
  }
}
