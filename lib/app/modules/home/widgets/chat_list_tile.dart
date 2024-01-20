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
    required this.heroTag,
  });

  final String userImage, userName, message, time, heroTag;
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
          Hero(
            tag: heroTag,
            child: CircleAvatar(
              radius: avatarSize,
              backgroundColor: kPrimaryColor.withOpacity(0.5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(avatarSize),
                child: MyNetworkImage(imageUrl: userImage),
              ),
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
        style: kTitleMedium,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        message,
        style: kBodyLarge,
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
                size: 16.r,
                color: isRead ? kTextLightColor : kPrimaryColor,
              ),
              const SizedBox(width: 4),
              Text(time, style: kBodyMedium)
            ],
          ),
          const SizedBox(height: 12),
          isRead
              ? const SizedBox()
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: 16,
                    width: 16,
                    child: ColoredBox(
                      color: kPrimaryColor,
                      child: Center(
                        child: Text(messageCount.toString(),
                            style:
                                kBodySmall.copyWith(color: kScaffoldBGColor)),
                      ),
                    ),
                  ),
                ),
          // : CircleAvatar(
          //     radius: 11.r,
          //     backgroundColor: kPrimaryColor,
          //     child: Center(
          //       child: Text(messageCount.toString(),
          //           style: kBodyMedium.copyWith(color: kScaffoldBGColor)),
          //     ),
          //   )
        ],
      ),
    );
  }
}
