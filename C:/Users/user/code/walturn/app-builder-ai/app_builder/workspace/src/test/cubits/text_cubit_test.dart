
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.walturn/cubits/text_cubit.dart';
import 'package:com.walturn/models/text_state.dart';

class MockTextCubit extends MockCubit<TextState> implements TextCubit {}

void main() {
	group('TextCubit', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = TextCubit();
		});

		tearDown(() {
			textCubit.close();
		});

		test('initial state is TextState with text "Cat" and clock icon', () {
			expect(textCubit.state, TextState(text: 'Cat', icon: Icons.access_time));
		});

		blocTest<TextCubit, TextState>(
			'emits [TextState(text: "Dog", icon: Icons.person)] when changeText is called',
			build: () => textCubit,
			act: (cubit) => cubit.changeText(),
			expect: () => [TextState(text: 'Dog', icon: Icons.person)],
		);
	});
}
