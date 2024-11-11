import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_text.dart';

class SelectionChip extends StatelessWidget {
  const SelectionChip({
    super.key,
    required this.isSelected,
    required this.text,
    this.borderRadius = 50,
    this.onTap,
  });

  final bool isSelected;
  final String text;
  final double borderRadius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
        width: 150,
        child: DecoratedBox(
            decoration: BoxDecoration(
              // gradient: !isSelected
              //     ? null
              //     : const LinearGradient(
              //         colors: [
              //           AppColors.primaryLight,
              //           AppColors.primary,
              //         ],
              //       ),
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: isSelected
                    ? theme.colorScheme.primary
                    : Colors.grey.shade400,
                width: isSelected ? 1.25 : 1.0,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(12.r, 12.r, 36.r, 12.r),
              child: Row(
                children: [
                  SizedBox(
                    height: 28.r,
                    width: 28.r,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: !isSelected
                            ? LinearGradient(
                                colors: [
                                  Colors.grey.shade200,
                                  Colors.grey.shade400,
                                ],
                              )
                            : LinearGradient(
                                colors: [
                                  theme.primaryColorLight,
                                  theme.primaryColor,
                                ],
                              ),
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.r),
                  FittedBox(
                    child: MyText(
                      text,
                      color: isSelected ? theme.dividerColor : theme.focusColor,
                      fontSize: 16,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
