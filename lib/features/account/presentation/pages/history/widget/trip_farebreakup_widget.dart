import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../common/common.dart';
import '../../../../../../core/utils/custom_text.dart';
import '../../../../../../l10n/app_localizations.dart';
import '../../../../application/acc_bloc.dart';
import 'fare_breakup.dart';

class TripFarebreakupWidget extends StatelessWidget {
  final BuildContext cont;
  final HistoryPageArguments arg;
  const TripFarebreakupWidget(
      {super.key, required this.cont, required this.arg});

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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (arg.historyData.isCancelled == 1)
                        ? MyText(
                            text: AppLocalizations.of(context)!.cancelled,
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: AppColors.red,
                                    fontWeight: FontWeight.w600),
                          )
                        : (arg.historyData.isCompleted == 1)
                            ? MyText(
                                text: AppLocalizations.of(context)!.fareBreakup,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontWeight: FontWeight.w600),
                              )
                            : Container()
                  ],
                ),
                SizedBox(height: size.width * 0.025),
                if (arg.historyData.isBidRide == 1 &&
                    arg.historyData.isCancelled == 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: size.width * 0.025,
                          ),
                          MyText(
                              text: (arg.historyData.paymentOpt == '1')
                                  ? AppLocalizations.of(context)!.cash
                                  : (arg.historyData.paymentOpt == '2')
                                      ? AppLocalizations.of(context)!.wallet
                                      : (arg.historyData.paymentOpt == '0')
                                          ? AppLocalizations.of(context)!.card
                                          : '',
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge),
                          (arg.historyData.requestBill == null)
                              ? MyText(
                                  text: (arg.historyData.isBidRide == 1)
                                      ? '${arg.historyData.requestedCurrencySymbol} ${arg.historyData.acceptedRideFare}'
                                      : (arg.historyData.isCompleted == 1)
                                          ? '${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.requestBill.data.totalAmount}'
                                          : '${arg.historyData.requestedCurrencySymbol} ${arg.historyData.requestEtaAmount}')
                              : MyText(
                                  text:
                                      '${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.requestBill.data.totalAmount}',
                                  textStyle:
                                      Theme.of(context).textTheme.displayLarge)
                        ],
                      ),
                    ],
                  ),
                if (arg.historyData.isCancelled != 1 &&
                    arg.historyData.requestBill != null)
                  Column(
                    children: [
                      if (arg.historyData.requestBill.data.basePrice != 0)
                        ...[FareBreakup(
                            showBorder: false,
                            text: AppLocalizations.of(context)!.basePrice,
                            price:
                                '${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.requestBill.data.basePrice}'), 
                                DottedLine( // ADDED: BY MG: Dotted line
                                dashLength: 2,
                                dashGapLength: 2,
                                dashRadius: 1,
                                lineThickness: 1,
                                dashColor: Theme.of(context).dividerColor,
                              ),],
                      if (arg.historyData.requestBill.data.distancePrice != 0)
                        ...[FareBreakup(
                            showBorder: false,
                            text: AppLocalizations.of(context)!.distancePrice,
                            price:
                                '${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.requestBill.data.distancePrice}'), DottedLine( // ADDED: BY MG: Dotted line
                                dashLength: 2,
                                dashGapLength: 2,
                                dashRadius: 1,
                                lineThickness: 1,
                                dashColor: Theme.of(context).dividerColor,
                              ),],
                      if (arg.historyData.requestBill.data.timePrice != 0)
                       ...[ FareBreakup(
                            showBorder: false,
                            text: AppLocalizations.of(context)!.timePrice,
                            price:
                                '${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.requestBill.data.timePrice}'), DottedLine( // ADDED: BY MG: Dotted line
                                dashLength: 2,
                                dashGapLength: 2,
                                dashRadius: 1,
                                lineThickness: 1,
                                dashColor: Theme.of(context).dividerColor,
                              ),],
                      if (arg.historyData.requestBill.data.waitingCharge != 0)
                        ...[FareBreakup(
                            showBorder: false,
                            text: AppLocalizations.of(context)!.waitingPrice,
                            price:
                                '${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.requestBill.data.waitingCharge}'), DottedLine( // ADDED: BY MG: Dotted line
                                dashLength: 2,
                                dashGapLength: 2,
                                dashRadius: 1,
                                lineThickness: 1,
                                dashColor: Theme.of(context).dividerColor,
                              ),],
                      if (arg.historyData.requestBill.data.adminCommision != 0)
                        ...[FareBreakup(
                            showBorder: false,
                            text: AppLocalizations.of(context)!.convFee,
                            price:
                                '${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.requestBill.data.adminCommision}'), DottedLine( // ADDED: BY MG: Dotted line
                                dashLength: 2,
                                dashGapLength: 2,
                                dashRadius: 1,
                                lineThickness: 1,
                                dashColor: Theme.of(context).dividerColor,
                              ),],
                      if (arg.historyData.requestBill.data.promoDiscount != 0)
                        ...[FareBreakup(
                          showBorder: false,
                          text: AppLocalizations.of(context)!.discount,
                          price:
                              '${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.requestBill.data.promoDiscount}',
                          textcolor: Theme.of(context).primaryColorDark,
                          pricecolor: Theme.of(context).primaryColorDark,
                        ), DottedLine( // ADDED: BY MG: Dotted line
                                dashLength: 2,
                                dashGapLength: 2,
                                dashRadius: 1,
                                lineThickness: 1,
                                dashColor: Theme.of(context).dividerColor,
                              ),],
                      if (arg.historyData.requestBill.data
                                  .additionalChargesAmount !=
                              0 &&
                          arg.historyData.requestBill.data
                                  .additionalChargesReason !=
                              null)
                        ...[FareBreakup(
                            showBorder: false,
                            text:
                                AppLocalizations.of(context)!.additionalCharges,
                            price:
                                '${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.requestBill.data.additionalChargesAmount}'), DottedLine( // ADDED: BY MG: Dotted line
                                dashLength: 2,
                                dashGapLength: 2,
                                dashRadius: 1,
                                lineThickness: 1,
                                dashColor: Theme.of(context).dividerColor,
                              ),],
                      ...[FareBreakup(
                          showBorder: false,
                          text: AppLocalizations.of(context)!.taxes,
                          price:
                              '${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.requestBill.data.serviceTax}')
                              // , DottedLine( // ADDED: BY MG: Dotted line
                              //   dashLength: 2,
                              //   dashGapLength: 2,
                              //   dashRadius: 1,
                              //   lineThickness: 1,
                              //   dashColor: Theme.of(context).dividerColor,
                              // ),
                              ],
                      if (arg.historyData.requestBill.data.driverTips != "0")
                        FareBreakup(
                          showBorder: false,
                          text: AppLocalizations.of(context)!.tips,
                          price:
                              '${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.requestBill.data.driverTips}',
                          textcolor: Theme.of(context).primaryColorDark,
                          pricecolor: Theme.of(context).primaryColorDark,
                        ),
                        SizedBox(height: size.height * 0.01,),
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
                      (arg.historyData.requestBill != null &&
                              arg.historyData.isBidRide != 1)
                          ? Padding(
                              padding: EdgeInsets.only(
                                bottom: size.width * 0.025,
                                top: size.width * 0.025,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Row(
                                    children: [
                                      MyText(
                                        text: AppLocalizations.of(context)!
                                            .customerPays,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(),
                                      )
                                    ],
                                  )),
                                  Row(
                                    children: [
                                      MyText(
                                        text: (arg.historyData.paymentOpt ==
                                                '1')
                                            ? AppLocalizations.of(context)!.cash
                                            : (arg.historyData.paymentOpt ==
                                                    '2')
                                                ? AppLocalizations.of(context)!
                                                    .wallet
                                                : (arg.historyData.paymentOpt ==
                                                        '0')
                                                    ? AppLocalizations.of(
                                                            context)!
                                                        .card
                                                    : '',
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.025,
                                      ),
                                      (arg.historyData.requestBill == null)
                                          ? Row(
                                              children: [
                                                MyText(
                                                  text: (arg.historyData
                                                              .isBidRide ==
                                                          1)
                                                      ? '${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.requestBill.data.acceptedRideFare}'
                                                      : (arg.historyData
                                                                  .isCompleted ==
                                                              1)
                                                          ? '${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.requestBill.data.totalAmount}'
                                                          : '${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.requestBill.data.requestEtaAmount}',
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: size.width *
                                                              0.045),
                                                ),
                                              ],
                                            )
                                          : MyText(
                                              text:
                                                  '${arg.historyData.requestBill.data.requestedCurrencySymbol} ${arg.historyData.requestBill.data.totalAmount}',
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          size.width * 0.045))
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
