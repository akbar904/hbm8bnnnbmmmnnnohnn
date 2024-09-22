
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.walturn/screens/home_screen.dart';

class MockTextCubit extends MockCubit<TextState> implements TextCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('Initial state displays "Cat" with clock icon', (WidgetTester tester) async {
			// Arrange
			final mockTextCubit = MockTextCubit();
			when(() => mockTextCubit.state).thenReturn(TextState(text: 'Cat', icon: Icons.access_time));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<TextCubit>(
						create: (_) => mockTextCubit,
						child: HomeScreen(),
					),
				),
			);

			// Assert
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('Tap changes text to "Dog" with person icon', (WidgetTester tester) async {
			// Arrange
			final mockTextCubit = MockTextCubit();
			whenListen(
				mockTextCubit,
				Stream.fromIterable([
					TextState(text: 'Cat', icon: Icons.access_time),
					TextState(text: 'Dog', icon: Icons.person),
				]),
				initialState: TextState(text: 'Cat', icon: Icons.access_time),
			);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<TextCubit>(
						create: (_) => mockTextCubit,
						child: HomeScreen(),
					),
				),
			);

			// Act
			await tester.tap(find.text('Cat'));
			await tester.pumpAndSettle();

			// Assert
			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
