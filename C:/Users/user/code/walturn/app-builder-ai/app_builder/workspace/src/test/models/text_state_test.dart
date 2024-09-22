
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:com.walturn/models/text_state.dart';

void main() {
	group('TextState Model Tests', () {
		test('TextState should correctly serialize and deserialize', () {
			final textState = TextState(text: 'Cat', icon: Icons.access_time);
			final json = textState.toJson();
			expect(json['text'], 'Cat');
			expect(json['icon'], Icons.access_time.codePoint);

			final deserialized = TextState.fromJson(json);
			expect(deserialized.text, 'Cat');
			expect(deserialized.icon, Icons.access_time);
		});
	});
}
