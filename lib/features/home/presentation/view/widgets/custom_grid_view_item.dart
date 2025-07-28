import 'package:first_task_elevate/features/home/presentation/manager/cubit/fetch_item_cubit.dart';
import 'package:first_task_elevate/features/home/presentation/view/widgets/custom_item_card.dart';
import 'package:flutter/material.dart';

class CustomGridViewItem extends StatelessWidget {
  const CustomGridViewItem({super.key, required this.baseStateFetchItems});

  final BaseStateFetchItems? baseStateFetchItems;

  @override
  Widget build(BuildContext context) {
    // Case 1: If state is null
    if (baseStateFetchItems == null) {
      return const Center(child: CircularProgressIndicator());
    }

    // Case 2: Loading
    if (baseStateFetchItems!.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // Case 3: Error
    if (baseStateFetchItems!.errorMessage.isNotEmpty) {
      return Center(
        child: Text(baseStateFetchItems!.errorMessage),
      );
    }

    // Case 4: Data
    if (baseStateFetchItems!.data.isEmpty) {
      return const Center(child: Text("No data available"));
    }

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: baseStateFetchItems!.data.length,
      separatorBuilder: (context, index) => const SizedBox(width: 5),
      itemBuilder: (context, index) {
        return CustomItemCard(
          itemCardEntities: baseStateFetchItems!.data[index],
        );
      },
    );
  }
}
