import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:restart_tagxi/common/app_constants.dart';
import 'package:restart_tagxi/core/utils/custom_navigation_icon.dart';
import 'package:restart_tagxi/core/utils/custom_text.dart';

class PageOptions extends StatelessWidget {
  final String list;
  final Function()? onTap;
  final Color? color;
  final IconData? icon;

  const PageOptions(
      {super.key, required this.list, this.onTap, this.color, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 9, top: 9,left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    spacing: 12,
              mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.center,  
                    children: [
                      NavigationIconWidget(icon: Icon(
                          icon,
                          size: 18,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                      // SizedBox(
                      //   width: 8,
                      // ),
                      MyText(
                        text: list,
                        textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).disabledColor,
                            fontSize: AppConstants().headerSize),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Theme.of(context).disabledColor,
                )
              ],
            ),
          ),
        ),
        // const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: DottedLine( // ADDED: BY MG: Dotted line
                                                                       dashLength: 2,
                                                                       dashGapLength: 2,
                                                                       dashRadius: 1,
                                                                       lineThickness: 1,
                                                                       dashColor: Theme.of(context).dividerColor,
                                                                     ),
                          ),
      ],
    );
  }
}
