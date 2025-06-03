import 'package:first_task_elevate/features/home/presentation/manager/cubit/fetch_item_cubit.dart';
import 'package:first_task_elevate/features/home/presentation/view/widgets/custom_grid_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBuilderWidget extends StatelessWidget {
  const BlocBuilderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchItemCubit, FetchItemState>(
      builder: (context, state) {
        switch (state) {
          case FetchItemInitial():
            // TODO: Handle this case.
            throw UnimplementedError();
          case FetchItemSuccess():
            return Expanded(
              child: CustomGridViewItem(
                items: state.items,
              ),
            );
          case FetchItemLoading():
            return Center(child: CircularProgressIndicator());
          case FetchItemFailure():
            return Center(child: Text(state.errorMessage));
        }
      },
    );
  }
}
