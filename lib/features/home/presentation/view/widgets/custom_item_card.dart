import 'package:first_task_elevate/features/home/entities/item_card_entities.dart';
import 'package:first_task_elevate/features/home/presentation/view/widgets/custom_description_item.dart';
import 'package:first_task_elevate/features/home/presentation/view/widgets/custom_image_item.dart';
import 'package:flutter/material.dart';

class CustomItemCard extends StatelessWidget {
  const CustomItemCard({
    super.key,
    required this.itemCardEntities,
  });
  final ItemCardEntities itemCardEntities;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AspectRatio(
      aspectRatio: 365 / 450,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 1.5,
            color: theme.colorScheme.primary.withAlpha(130),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 5,
          children: [
            Expanded(
              flex: 1,
              child: CustomImageItem(
                imagePath: itemCardEntities.imagePath,
              ),
            ),
            CustomDescriptionItem(
              itemCardEntities: itemCardEntities,
            ),
          ],
        ),
      ),
    );
  }
}
