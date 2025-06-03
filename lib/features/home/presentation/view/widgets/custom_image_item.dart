import 'package:first_task_elevate/core/model/custom_circular_model.dart';
import 'package:first_task_elevate/features/home/presentation/view/widgets/custom_circular.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomImageItem extends StatelessWidget {
  const CustomImageItem({
    super.key,
    required this.imagePath,
  });
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imagePath),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCircular(
              circularModel: CustomCircularModel(
                bgColor: Colors.white,
                icon: FontAwesomeIcons.heart,
                iconColor: theme.colorScheme.primary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
