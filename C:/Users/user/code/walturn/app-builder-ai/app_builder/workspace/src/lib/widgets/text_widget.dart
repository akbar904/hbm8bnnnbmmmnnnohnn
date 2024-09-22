
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.walturn/cubits/text_cubit.dart';
import 'package:com.walturn/models/text_state.dart';

class TextWidget extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return BlocBuilder<TextCubit, TextState>(
			builder: (context, state) {
				return GestureDetector(
					onTap: () {
						context.read<TextCubit>().changeText();
					},
					child: Row(
						children: [
							Text(state.text),
							Icon(state.icon),
						],
					),
				);
			},
		);
	}
}
