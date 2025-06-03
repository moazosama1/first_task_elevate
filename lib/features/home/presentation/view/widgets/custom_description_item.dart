import 'package:first_task_elevate/core/model/custom_circular_model.dart';
import 'package:first_task_elevate/features/home/entities/item_card_entities.dart';
import 'package:first_task_elevate/features/home/presentation/view/widgets/custom_circular.dart';
import 'package:flutter/material.dart';

class CustomDescriptionItem extends StatelessWidget {
  const CustomDescriptionItem({
    super.key,
    required this.itemCardEntities,
  });
  final ItemCardEntities itemCardEntities;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        spacing: 3,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            itemCardEntities.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: theme.colorScheme.primary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "EGP ${itemCardEntities.totalPrice}",
            style: TextStyle(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              Text(
                "Review (${itemCardEntities.aRating})",
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontSize: 14,
                ),
              ),
              Icon(
                Icons.star,
                color: Color(0xffffd800),
              ),
              Spacer(),
              CustomCircular(
                circularModel: CustomCircularModel(
                  bgColor: theme.colorScheme.primary,
                  icon: Icons.add,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
