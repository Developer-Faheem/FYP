import 'package:flutter/material.dart';

class PrivacyPolicyItem extends StatelessWidget {
  final String title;
  final String content;

  const PrivacyPolicyItem({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        title != '' ? SizedBox(height: 8.0) : SizedBox(),
        Text(
          content,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        content != '' ? SizedBox(height: 16.0) : SizedBox(),
      ],
    );
  }
}
