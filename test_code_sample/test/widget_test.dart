import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_code_sample/count_widget.dart';
import 'package:test_code_sample/scroll_widget.dart';

main() {
  testWidgets("ScrollWidget Test", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ScrollWidget()));

    // 초기 상단 아이템이 Item 1 인지 확인
    expect(find.text("Item 1"), findsWidgets);

    // Item 2 아이템 클릭
    await tester.tap(find.text("Item 2"));
    await tester.pump();

    // 상단 아이템이 Item 2인지 확인
    expect(find.text("Item 2"), findsWidgets);

    // Item 2를 찾아 y축으로 -250 픽셀 스크롤
    await tester.drag(find.text("Item 2"), const Offset(0, -250));
    // 애니메이션 끝날 때까지 대기
    await tester.pumpAndSettle();

    // 상단 아이템이 Item 5인지 확인
    expect(find.text("Item 5"), findsOneWidget);
  });
  testWidgets("CountWidget Test", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CountWidget()));

    // count 값이 0인지
    expect(find.text("0"), findsOneWidget);
    // count 값이 1이 아닌지
    expect(find.text("1"), findsNothing);
    // count 값이 -1이 아닌지
    expect(find.text("-1"), findsNothing);

    // 증가 버튼 클릭
    await tester.tap(find.byIcon(Icons.add));
    // 위젯 업데이트
    await tester.pump();
    // count 값이 1인지
    expect(find.text("1"), findsOneWidget);

    // 감소 버튼 2번 클릭
    await tester.tap(find.byIcon(Icons.remove));
    await tester.tap(find.byIcon(Icons.remove));
    // 위젯 업데이트
    await tester.pump();
    // count 값이 -1인지
    expect(find.text("-1"), findsOneWidget);

    // 초기화 버튼 클릭
    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();
    // count 값이 0인지
    expect(find.text("0"), findsOneWidget);
  });
}
