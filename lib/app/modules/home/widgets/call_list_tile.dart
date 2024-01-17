import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/config/theme/color.dart';
import '../../../data/config/theme/style.dart';
import '../../../widgets/my_network_image.dart';

class CallListTile extends StatelessWidget {
  const CallListTile({
    super.key,
    this.userImage =
        'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
    this.userName = 'Rakib Hossain',
    this.message = 'I have booked your house cleaning service',
    this.isActive = true,
    this.onTap,
  });

  final String userImage, userName, message;
  final bool isActive;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final double avatarSize = 30.r;

    return ListTile(
        onTap: onTap,
        tileColor: kWhite,
        leading: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: avatarSize,
              backgroundColor: kPrimaryColor.withOpacity(0.5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(avatarSize),
                child: MyNetworkImage(imageUrl: userImage),
              ),
            ),
            Positioned(
              top: 20,
              child: Text(
                '●',
                style: kHeadlineLarge.copyWith(
                    color: isActive ? Colors.green : Colors.grey),
              ),
            )
          ],
        ),
        title: Text(
          userName,
          style: kTitleSmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          message,
          style: kBodyMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(
          Icons.phone,
          color: kPrimaryColor,
        ));
  }
}
