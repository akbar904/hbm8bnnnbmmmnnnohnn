
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.walturn/main.dart';

class MockTextCubit extends MockCubit<TextState> implements TextCubit {}

void main() {
	group('MyApp Widget Tests', () {
		testWidgets('shows initial text and icon', (tester) async {
			await tester.pumpWidget(MyApp());
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('changes text and icon on tap', (tester) async {
			await tester.pumpWidget(MyApp());
			await tester.tap(find.text('Cat'));
			await tester.pump();
			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});

	group('TextCubit Tests', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = MockTextCubit();
		});

		blocTest<TextCubit, TextState>(
			'emits new state when changeText is called',
			build: () => textCubit,
			act: (cubit) => cubit.changeText(),
			expect: () => [
				TextState(text: 'Dog', icon: Icons.person),
			],
		);

		test('initial state is Cat with clock icon', () {
			final cubit = TextCubit();
			expect(cubit.state, TextState(text: 'Cat', icon: Icons.access_time));
		});
	});
}
