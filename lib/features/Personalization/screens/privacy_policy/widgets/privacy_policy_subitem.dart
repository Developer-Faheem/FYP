import 'package:flutter/material.dart';

class PrivacyPolicySubItem extends StatelessWidget {
  final String title;
  final String content;

  const PrivacyPolicySubItem({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != ''
            ? Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  "- $title",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
            : SizedBox(),
        content != ''
            ? Padding(
                padding: EdgeInsets.only(left: 32.0),
                child: Text(
                  content,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              )
            : SizedBox(),
        SizedBox(height: 8.0),
      ],
    );
  }
}
