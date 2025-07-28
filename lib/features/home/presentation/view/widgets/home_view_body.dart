import 'package:first_task_elevate/features/home/presentation/view/widgets/bloc_builder_widget.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          BlocBuilderWidget(),
        ],
      ),
    );
  }
}
