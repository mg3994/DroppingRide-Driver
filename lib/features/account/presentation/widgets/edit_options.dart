import 'package:flutter/material.dart';
import 'package:restart_tagxi/core/utils/custom_card.dart';
import 'package:restart_tagxi/core/utils/custom_navigation_icon.dart';
import '../../../../core/utils/custom_text.dart';
import '../../../../l10n/app_localizations.dart';

class EditOptions extends StatelessWidget {
  final String text;
  final String header;
  final Function()? onTap;
  final Icon? icon;

  const EditOptions(
      {super.key,
      required this.text,
      required this.header,
      required this.onTap,
      this.icon});

  @override
  Widget build(BuildContext context) {
    final bool showEditIcon = header == AppLocalizations.of(context)!.name ||
        header == AppLocalizations.of(context)!.gender ||
        header == AppLocalizations.of(context)!.email;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: header,
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 18,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                CustomCard
                (
                  padding: EdgeInsets.symmetric(horizontal: 9,vertical: 5),
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  blurRadius: 4,
                  border: Border.all(
                      width: 1,
                      color: Theme.of(context).dividerColor.withOpacity(0.5)),
                  child: Row(
                   
                    // mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [  MyText(
                      text: text,
                      textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).disabledColor, fontSize: 18),
                    ),
                    
                    (showEditIcon)
                    ?  NavigationIconWidget(icon: Icon(
                          Icons.edit,
                          size: 15,
                          color: Theme.of(context).disabledColor,
                        ),
                    )
                    : const SizedBox()
                  ]),
                )
                ],
              ),
             
            ],
          ),
        ),
        // const SizedBox(height: 5),
        // const Divider(
        //   height: 1,
        //   color: Color(0xFFD9D9D9),
        // ),
        const SizedBox(height: 25),
      ],
    );
  }
}
