import 'package:flutter/material.dart';
import 'package:vendor_app/helper/colors.dart';

import '../../../helper/common_appbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonAppbar(
        title: 'Notification',
        body: ListView(
          children: [
            NotificationText(
              notificationsTitle: 'You have a new notification message',
              notificationBody:
                  'Your subscription/package will expire on 01-10-2024.',
            ),
            NotificationText(
              notificationsTitle: 'You have a new notification message',
              notificationBody:
                  'Your subscription/package will expire on 03-10-2024.',
            ),
            NotificationText(
              notificationsTitle: 'You have a new notification message',
              notificationBody:
                  'Your subscription/package will expire on 07-10-2024.',
            ),
            NotificationText(
              notificationsTitle: 'You have a new notification message',
              notificationBody:
                  'Your subscription/package will expire on 10-10-2024.',
            ),
            NotificationText(
              notificationsTitle: 'You have a new notification message',
              notificationBody:
                  'Your subscription/package will expire on 15-10-2024.',
            ),
            NotificationText(
              notificationsTitle: 'You have a new notification message',
              notificationBody:
                  'Your subscription/package will expire on 18-10-2024.',
            ),
            NotificationText(
              notificationsTitle: 'You have a new notification message',
              notificationBody:
                  'Your subscription/package will expire on 22-10-2024.',
            ),
            NotificationText(
              notificationsTitle: 'You have a new notification message',
              notificationBody:
                  'Your subscription/package will expire on 25-10-2024.',
            ),
            NotificationText(
              notificationsTitle: 'You have a new notification message',
              notificationBody:
                  'Your subscription/package will expire on 28-10-2024.',
            ),
            NotificationText(
              notificationsTitle: 'You have a new notification message',
              notificationBody:
                  'Your subscription/package will expire on 30-10-2024.',
            ),
          ],
        ));
  }
}

class NotificationText extends StatelessWidget {
  final String notificationsTitle;
  final String notificationBody;

  const NotificationText({
    super.key,
    required this.notificationsTitle,
    required this.notificationBody,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: AppColors.whiteColor,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        title: Row(
          children: [
            Text(
              notificationsTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Text(
              notificationBody,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.grey),
            ),
            // setWidth(width: 10),
            // Text(
            //   notificationDate,
            //   style: Theme.of(context)
            //       .textTheme
            //       .bodyMedium
            //       ?.copyWith(color: Colors.grey),
            // ),
          ],
        ),
      ),
    );
  }
}
