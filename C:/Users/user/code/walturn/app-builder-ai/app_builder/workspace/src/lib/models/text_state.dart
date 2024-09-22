
import 'package:flutter/material.dart';

class TextState {
	final String text;
	final IconData icon;

	TextState({required this.text, required this.icon});

	Map<String, dynamic> toJson() {
		return {
			'text': text,
			'icon': icon.codePoint,
		};
	}

	factory TextState.fromJson(Map<String, dynamic> json) {
		return TextState(
			text: json['text'],
			icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
		);
	}
}
