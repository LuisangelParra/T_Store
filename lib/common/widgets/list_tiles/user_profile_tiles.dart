import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCIrcularImage(
        image: TImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text('Luisangel Parra', style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
      subtitle: Text('support@lpdev.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
      trailing: IconButton(onPressed: () {}, icon: const Icon(Iconsax.edit, color: TColors.white,)),
    );
  }
}
