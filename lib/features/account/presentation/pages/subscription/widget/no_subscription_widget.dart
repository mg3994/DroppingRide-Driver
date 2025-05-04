import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restart_tagxi/core/utils/custom_card.dart';

import '../../../../../../common/common.dart';
import '../../../../../../core/utils/custom_button.dart';
import '../../../../../../core/utils/custom_text.dart';
import '../../../../../../l10n/app_localizations.dart';
import '../../../../application/acc_bloc.dart';

class NoSubscriptionWidget extends StatelessWidget {
  final BuildContext cont;
  final bool isFromAccPage;
  const NoSubscriptionWidget({super.key, required this.cont, required this.isFromAccPage});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocProvider.value(
      value: cont.read<AccBloc>(),
      child: BlocBuilder<AccBloc, AccState>(
        builder: (context, state) {
          return Center(
              child: Stack(
            children: [
              CustomCard(
                margin: EdgeInsets.only(
                  top: size.height * 0.08,
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  bottom: size.height * 0.05,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.noSubscription),
                      SizedBox(height: size.height * 0.04),
                      MyText(
                        text: AppLocalizations.of(context)!.noSubscription,
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(
                            //   color:
                            //  AppColors.blackText,
                              fontSize: 16),
                      ),
                      SizedBox(height: size.height * 0.004),
                          DottedLine( // ADDED: BY MG: Dotted line
                                                                     dashLength: 2,
                                                                     dashGapLength: 2,
                                                                     dashRadius: 1,
                                                                     lineThickness: 1,
                                                                     dashColor: Theme.of(context).dividerColor,
                                                                   ),
                      SizedBox(height: size.height * 0.015),
                
                      MyText(
                        text: AppLocalizations.of(context)!.noSubscriptionContent,
                        textStyle:
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  // color: AppColors.black,
                                  fontSize: 12,
                                ),
                        maxLines: 5,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: size.width * 0.02,
                child: Row(
                  children: [
                    (isFromAccPage)
                        ? InkWell(
                            onTap: () {
                              Navigator.pop(context, false);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: size.width * 0.07,
                              color: AppColors.black,
                            ),
                          )
                        : const SizedBox(),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    MyText(
                      text: AppLocalizations.of(context)!.subscription,
                      textStyle: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontSize: 18, color: AppColors.blackText),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: size.height * 0.08,
                left: 0,
                right: 0,
                child: CustomButton(
                  buttonName: AppLocalizations.of(context)!.choosePlan,
                  borderRadius: 20,
                  onTap: () {
                    context.read<AccBloc>().add(
                          ChoosePlanEvent(isPlansChoosed: true),
                        );
                  },
                ),
              ),
            ],
          ));
        },
      ),
    );
  }
}
