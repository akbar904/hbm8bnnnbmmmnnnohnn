
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/text_cubit.dart';
import '../widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Home Screen'),
			),
			body: Center(
				child: BlocBuilder<TextCubit, TextState>(
					builder: (context, state) {
						return GestureDetector(
							onTap: () => context.read<TextCubit>().changeText(),
							child: TextWidget(
								text: state.text,
								icon: state.icon,
							),
						);
					},
				),
			),
		);
	}
}
