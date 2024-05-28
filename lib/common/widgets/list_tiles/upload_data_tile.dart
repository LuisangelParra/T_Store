import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class TUploadDataMenuTile extends StatelessWidget {
  const TUploadDataMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.icon2,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final IconData icon2;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: TColors.primary,
      ),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      trailing: Icon(
        icon2,
        size: 30,
        color: TColors.primary,
      ),
      onTap: onTap,
    );
  }
}
