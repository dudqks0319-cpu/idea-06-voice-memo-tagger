import 'package:flutter_test/flutter_test.dart';
import 'package:app_06_voice_memo_tagger/main.dart';

void main() {
  testWidgets('앱 타이틀 렌더링', (tester) async {
    await tester.pumpWidget(const IdeaApp());
    expect(find.textContaining('음성메모'), findsWidgets);
  });
}
