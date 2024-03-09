import 'package:flutter/material.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/text_strings.dart';

class FaqWidget extends StatelessWidget {
  final String question;
  final String answer;
  const FaqWidget({
    required this.answer,
    required this.question,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent, // Set divider color to transparent
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: const Icon(Icons.arrow_drop_down_circle),
        iconColor: SColors.tertiary,
        children: [
          Text(
            answer,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
