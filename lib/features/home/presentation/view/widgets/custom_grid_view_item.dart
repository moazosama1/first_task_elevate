import 'package:first_task_elevate/features/home/entities/item_card_entities.dart';
import 'package:first_task_elevate/features/home/presentation/view/widgets/custom_item_card.dart';
import 'package:flutter/material.dart';

class CustomGridViewItem extends StatelessWidget {
  const CustomGridViewItem({super.key, required this.items});
  final List<ItemCardEntities> items;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (context, index) => CustomItemCard(
        itemCardEntities: items[index],
      ),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
    );
  }
}
