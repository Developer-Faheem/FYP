import 'package:flutter/material.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class WorkingHours extends StatelessWidget {
  final String day;
  final String timing;
  const WorkingHours({
    required this.day,
    required this.timing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: SSizes.xs),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              day,
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12),
            ),
          ),
          const SizedBox(width: SSizes.lg),
          Expanded(
            flex: 2,
            child: Text(
              timing,
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
