import 'package:flutter/material.dart';

class PrivacyPolicyItem extends StatelessWidget {
  final String title;
  final String content;

  const PrivacyPolicyItem({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        title != '' ? const SizedBox(height: 8.0) : const SizedBox(),
        Text(
          content,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        content != '' ? const SizedBox(height: 16.0) : const SizedBox(),
      ],
    );
  }
}
