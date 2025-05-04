import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/model/user_detail_model.dart';
import '../../../../../../core/utils/custom_text.dart';
import '../../../../../../l10n/app_localizations.dart';
import '../../../../application/acc_bloc.dart';
import 'payment_gatewaylist_widget.dart';

class AddMoneyWalletWidget extends StatelessWidget {
  final BuildContext cont;
  final String minWalletAmount;
  const AddMoneyWalletWidget({super.key, required this.cont,required this.minWalletAmount});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocProvider.value(value: cont.read<AccBloc>(),
    child: BlocBuilder<AccBloc,AccState>(builder: (context, state) {
      return Container(
        padding: MediaQuery.of(context).viewInsets,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size.width * 0.05),
                topRight: Radius.circular(size.width * 0.05))),
        child: Container(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start,children: [
                MyText(text: AppLocalizations.of(context)?.addMoney, textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),)
              ],),
               DottedLine( // ADDED: BY MG: Dotted line
                                                                     dashLength: 2,
                                                                     dashGapLength: 2,
                                                                     dashRadius: 1,
                                                                     lineThickness: 1,
                                                                     dashColor: Theme.of(context).dividerColor,
                                                                   ),
              Container(
                height: size.width * 0.128,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        width: 0.8, color: Theme.of(context).disabledColor)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * 0.15,
                      height: size.width * 0.128,
                      decoration: BoxDecoration(
                          borderRadius: (context.read<AccBloc>().textDirection == 'ltr')
                              ? const BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  bottomLeft: Radius.circular(4),
                                )
                              : const BorderRadius.only(
                                  topRight: Radius.circular(4),
                                  bottomRight: Radius.circular(4)),
                          color: Theme.of(context).scaffoldBackgroundColor),
                      alignment: Alignment.center,
                      child: MyText(text: userData!.currencySymbol.toString(),textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(width: size.width * 0.05),
                    Container(
                      height: size.width * 0.128,
                      width: size.width * 0.6,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Theme.of(context).cardColor),
                      child: TextField(
                        controller:
                            context.read<AccBloc>().walletAmountController,
                        onChanged: (value) {
                          context.read<AccBloc>().addMoney = int.tryParse(value) ?? 0;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 12),
                            hintText:
                                AppLocalizations.of(context)!.enterAmount),
                        maxLines: 1,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.width * 0.05
              ),
              Column(
                spacing: 4,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<AccBloc>().walletAmountController.text =
                              double.parse(minWalletAmount).toString();
                          context.read<AccBloc>().addMoney = double.parse(minWalletAmount);
                        },
                        child: Container(
                          height: size.width * 0.11,
                          width: size.width * 0.17,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).disabledColor,
                                  width: 1.2),
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(4)),
                          alignment: Alignment.center,
                          child: MyText(
                              text:
                                  '${context.read<AccBloc>().walletResponse!.currencySymbol.toString()}${double.parse(minWalletAmount)}'),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.05
                      ),
                      InkWell(
                        onTap: () {
                          context.read<AccBloc>().walletAmountController.text =
                              (double.parse(minWalletAmount) *2).toString();
                          context.read<AccBloc>().addMoney = double.parse(minWalletAmount) * 2;
                        },
                        child: Container(
                          height: size.width * 0.11,
                          width: size.width * 0.17,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).disabledColor,
                                  width: 1.2),
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(4)),
                          alignment: Alignment.center,
                          child: MyText(
                              text:
                                  '${context.read<AccBloc>().walletResponse!.currencySymbol.toString()}${double.parse(minWalletAmount) * 2}'),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.05
                      ),
                      InkWell(
                        onTap: () {
                          context.read<AccBloc>().walletAmountController.text =
                              (double.parse(minWalletAmount) * 3).toString();
                          context.read<AccBloc>().addMoney = double.parse(minWalletAmount) * 3;
                        },
                        child: Container(
                          height: size.width * 0.11,
                          width: size.width * 0.17,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).disabledColor,
                                  width: 1.2),
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(4)),
                          alignment: Alignment.center,
                          child: MyText(
                              text:
                                  '${context.read<AccBloc>().walletResponse!.currencySymbol.toString()}${double.parse(minWalletAmount) * 3}'),
                        ),
                      ),
                    ],
                  ),
                                               DottedLine( // ADDED: BY MG: Dotted line
                                                                     dashLength: 2,
                                                                     dashGapLength: 2,
                                                                     lineLength: size.width * 0.7,
                                                                     dashRadius: 1,
                                                                     lineThickness: 1,
                                                                     dashColor: Theme.of(context).dividerColor,
                                                                   ),
                ],
              ),
              SizedBox(
                height: size.width * 0.05
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: size.width * 0.11,
                      width: size.width * 0.425,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 1.2),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4)),
                      alignment: Alignment.center,
                      child: MyText(
                        text: AppLocalizations.of(context)!.cancel,
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (context
                              .read<AccBloc>()
                              .walletAmountController
                              .text
                              .isNotEmpty &&
                          context.read<AccBloc>().addMoney != null) {
                        
                        final confirmPayment = cont.read<AccBloc>();
                        final list = cont
                                        .read<AccBloc>()
                                        .walletPaymentGatways;
                        final currency = context.read<AccBloc>().walletResponse!.currencySymbol;
                        final money = context.read<AccBloc>().addMoney.toString();
                        Navigator.pop(context);                
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: false,
                            enableDrag: true,
                            isDismissible: true,
                            builder: (_) {
                              return BlocProvider.value(
                                value: confirmPayment,
                                child: PaymentGatewaylistWidget(
                                    cont:context,
                                    currencySymbol: currency,
                                    amount: money,
                                    walletPaymentGatways:list
                                    ),
                              );
                            });
                      }
                    },
                    child: Container(
                      height: size.width * 0.11,
                      width: size.width * 0.425,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(4)),
                      alignment: Alignment.center,
                      child: MyText(
                        text: AppLocalizations.of(context)!.addMoney,
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    
    },));
  }
}