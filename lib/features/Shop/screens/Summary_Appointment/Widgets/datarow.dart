import 'package:flutter/material.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class DataRows extends StatelessWidget {
  final String attribute;
  final String data;

  const DataRows({Key? key, required this.attribute, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: SSizes.xs),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              attribute,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const SizedBox(width: SSizes.lg),
          Expanded(
            flex: 2,
            child: Text(
              data,
              style: Theme.of(context).textTheme.titleSmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
