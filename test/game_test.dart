import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kose_yerlestirme/oyun_kose_yerlestirme.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(koseConfig.title.length, 33);
    expect(koseConfig.tagline.length, 33);
    for (final s in koseConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler çözülebilir', () {
    final planner = LevelPlanner(gameId: koseId, optionalMechanics: const []);
    for (final lv in [1, 77, 1500, 33333, 49999]) {
      final gl = koseRules.build(planner.spec(lv));
      expect(gl.validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
