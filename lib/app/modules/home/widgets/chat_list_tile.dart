import 'package:chat_app_demo/app/widgets/my_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/config/theme/color.dart';
import '../../../data/config/theme/style.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    super.key,
    this.userImage =
        'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
    this.userName = 'Rakib Hossain',
    this.message = 'I have booked your house cleaning service',
    this.time = '10:10 AM',
    this.messageCount = 1,
    this.isRead = true,
    this.isActive = true,
    this.onTap,
  });

  final String userImage, userName, message, time;
  final int messageCount;
  final bool isRead, isActive;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final double avatarSize = 30.r;

    return ListTile(
      onTap: onTap,
      tileColor: isRead ? kWhite : Colors.grey.shade200,
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
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // SvgPicture.asset(
              //   'assets/icons/double_tick.svg',
              //   height: 12,
              //   color: isRead ? kPrimaryColor : kTextLightColor,
              // ),
              Icon(
                Icons.check_box,
                size: 12,
                color: isRead ? kPrimaryColor : kTextLightColor,
              ),
              const SizedBox(width: 4),
              Text(time, style: kBodySmall)
            ],
          ),
          const SizedBox(height: 12),
          isRead
              ? const SizedBox()
              : CircleAvatar(
                  radius: 9.r,
                  backgroundColor: kPrimaryColor,
                  child: Text(messageCount.toString(),
                      style: kBodySmall.copyWith(color: kScaffoldBGColor)),
                )
        ],
      ),
    );
  }
}