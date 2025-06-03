import 'package:first_task_elevate/core/model/custom_circular_model.dart';
import 'package:flutter/material.dart';

class CustomCircular extends StatelessWidget {
  const CustomCircular({
    required this.circularModel,
    super.key,
  });
  final CustomCircularModel circularModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: circularModel.bgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
        shape: BoxShape.circle,
      ),
      child: Icon(circularModel.icon,
          color: circularModel.iconColor ?? Colors.white),
    );
  }
}
