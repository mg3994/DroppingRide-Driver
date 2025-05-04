import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../common/common.dart';
import '../../../../../../core/utils/custom_text.dart';
import '../../../../../../l10n/app_localizations.dart';
import '../../../../application/acc_bloc.dart';

class TripEarningsWidget extends StatelessWidget {
  final BuildContext cont;
  final HistoryPageArguments arg;
  const TripEarningsWidget({super.key, required this.cont, required this.arg});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocProvider.value(
      value: cont.read<AccBloc>(),
      child: BlocBuilder<AccBloc, AccState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.all(size.width * 0.05),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: AppLocalizations.of(context)!.earnings,
                    textStyle: Theme.of(context).textTheme.bodyLarge!
                                    .copyWith(fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColorDark,
                          // fontWeight: FontWeight.bold,
                          // fontSize: 14,
                        ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Column(
                  spacing: 4,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            MyText(
                              text: AppLocalizations.of(context)!.totalFare,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                          
                        if (arg.historyData.requestBill != null)
                          MyText(
                            text: (arg.historyData.isBidRide == 1)
                                ? '${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.acceptedRideFare}'
                                : (arg.historyData.isCompleted == 1)
                                    ? '${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.requestBill.data.totalAmount}'
                                    : '${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.requestBill.data.requestEtaAmount}',
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                      ],
                    ),
                    DottedLine( // ADDED: BY MG: Dotted line
                              dashLength: 2,
                              dashGapLength: 2,
                              dashRadius: 1,
                              lineThickness: 1,
                              dashColor: Theme.of(context).dividerColor,
                            ),
                  ],
                ),
              ),
              if (arg.historyData.requestBill != null)
                Padding(
                  padding: EdgeInsets.only(
                    bottom: size.width * 0.025,
                    top: size.width * 0.025,
                  ),
                  child: Column(
                    spacing: 4,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              MyText(
                                text: AppLocalizations.of(context)!
                                    .customerConvenienceFee,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(),
                              )
                            ],
                          )),
                          MyText(
                            text:
                                '-${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.requestBill.data.adminCommision}',
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: AppColors.red),
                          )
                        ],
                      ),
                    
                    DottedLine( // ADDED: BY MG: Dotted line
                              dashLength: 2,
                              dashGapLength: 2,
                              dashRadius: 1,
                              lineThickness: 1,
                              dashColor: Theme.of(context).dividerColor,
                            ),
                    ],
                  ),
                ),
               if (arg.historyData.requestBill != null && (arg.historyData.requestBill.data.cancellationFee != 0.0) &&
               (arg.historyData.requestBill.data.cancellationFee != 0))
                Padding(
                  padding: EdgeInsets.only(
                    bottom: size.width * 0.025,
                    top: size.width * 0.025,
                  ),
                  child: Column(
                    spacing: 4,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              MyText(
                                text: AppLocalizations.of(context)!
                                    .cancellationFee,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(),
                              )
                            ],
                          )),
                          MyText(
                            text:
                                '-${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.requestBill.data.cancellationFee}',
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: AppColors.red),
                          )
                        ],
                      ),
                      DottedLine( // ADDED: BY MG: Dotted line
                              dashLength: 2,
                              dashGapLength: 2,
                              dashRadius: 1,
                              lineThickness: 1,
                              dashColor: Theme.of(context).dividerColor,
                            ),
                    ],
                  ),
                ), 
               if (arg.historyData.requestBill != null)   
              Padding(
                padding: EdgeInsets.only(
                  bottom: size.width * 0.025,
                  top: size.width * 0.025,
                ),
                child: Column(
                  spacing: 4,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            MyText(
                              text: AppLocalizations.of(context)!.commission,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(),
                            )
                          ],
                        )),
                        MyText(
                          text:
                              '-${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.requestBill.data.adminCommisionFromDriver}',
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColors.red),
                        )
                      ],
                    ),
                    DottedLine( // ADDED: BY MG: Dotted line
                              dashLength: 2,
                              dashGapLength: 2,
                              dashRadius: 1,
                              lineThickness: 1,
                              dashColor: Theme.of(context).dividerColor,
                            ),
                  ],
                ),
              ),
               if (arg.historyData.requestBill != null)
              Padding(
                padding: EdgeInsets.only(
                  bottom: size.width * 0.025,
                  top: size.width * 0.025,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            MyText(
                              text: AppLocalizations.of(context)!.taxText,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(),
                            )
                          ],
                        )),
                        MyText(
                          text:
                              '-${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.requestBill.data.serviceTax}',
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColors.red),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              if (arg.historyData.requestBill.data.promoDiscount != 0)
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            MyText(
                              text: AppLocalizations.of(context)!
                                  .discountFromWallet,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(),
                            )
                          ],
                        ),
                      ),
                      MyText(
                        text:
                            '${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.requestBill.data.promoDiscount}',
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.green),
                      )
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        150 ~/ 2,
                        (index) => Expanded(
                          child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(2),color: index.isEven
                                  ? AppColors.darkSecondaryColor
                                  : Colors.transparent,),
                              height: 2,
                              
                            ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            MyText(
                              text: AppLocalizations.of(context)!.tripEarnings,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                            )
                          ],
                        )),
                        MyText(
                          text:
                              '${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.requestBill.data.driverCommision}',
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
