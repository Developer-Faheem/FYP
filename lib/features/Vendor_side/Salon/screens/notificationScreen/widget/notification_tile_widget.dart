import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage('assets/images/profile/anonymous.jpg'),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add Booking",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  "New booking added by Anna pandey",
                  style: Theme.of(context).textTheme.headlineSmall,
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Text(
            "02 min ago",
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
