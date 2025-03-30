import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restart_tagxi/common/common.dart';
import 'package:restart_tagxi/core/utils/custom_card.dart';
import 'package:restart_tagxi/features/driverprofile/presentation/pages/driver_profile_pages.dart';

import '../../../../core/utils/custom_background.dart';
import '../../../../core/utils/custom_button.dart';
import '../../../../core/utils/custom_loader.dart';
import '../../../../core/utils/custom_text.dart';
import '../../../../core/utils/custom_textfield.dart';
import '../../../../l10n/app_localizations.dart';
import '../../application/auth_bloc.dart';

class ApplyRefferalPage extends StatelessWidget {
  static const String routeName = '/applyRefferalPage';
  const ApplyRefferalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AuthBloc()..add(GetDirectionEvent()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitialState) {
            CustomLoader.loader(context);
          } else if (state is AuthDataLoadingState) {
            CustomLoader.loader(context);
          } else if (state is AuthDataLoadedState) {
            CustomLoader.dismiss(context);
          } else if (state is AuthDataSuccessState) {
            CustomLoader.dismiss(context);
          } else if (state is LoginLoadingState) {
            CustomLoader.loader(context);
          } else if (state is LoginFailureState) {
            CustomLoader.dismiss(context);
          } else if (state is ReferralSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
                context,
                DriverProfilePage.routeName,
                arguments: VehicleUpdateArguments(
                  from: '',
                ),
                (route) => false);
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Scaffold(
              body:
                  //  CustomBackground(child:
                  SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.width * 0.1),
                      CustomCard(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                  text: AppLocalizations.of(context)!
                                      .applyReferal,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(fontWeight: FontWeight.bold)),
                              SizedBox(height: size.width * 0.01),
                              DottedLine(
                                // ADDED: BY MG: Dotted line
                                dashLength: 2,
                                dashGapLength: 2,
                                dashRadius: 1,
                                lineThickness: 1,
                                dashColor: Theme.of(context).dividerColor,
                              ),
                              SizedBox(height: size.width * 0.07),
                              CustomTextField(
                                controller: context
                                    .read<AuthBloc>()
                                    .rReferralCodeController,
                                filled: true,
                                hintText: AppLocalizations.of(context)!
                                    .enterReferralCode,
                              ),
                              SizedBox(height: size.width * 0.07),
                            ]),
                      ),
                      SizedBox(height: size.width * 0.1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            buttonName: AppLocalizations.of(context)!.skip,
                            width: size.width * 0.4,
                            onTap: () {
                              context
                                  .read<AuthBloc>()
                                  .add(ReferralEvent(referralCode: 'Skip'));
                            },
                          ),
                          CustomButton(
                            buttonName: AppLocalizations.of(context)!.apply,
                            isLoader: context.read<AuthBloc>().isLoading,
                            width: size.width * 0.4,
                            onTap: () {
                              context.read<AuthBloc>().add(ReferralEvent(
                                  referralCode: context
                                      .read<AuthBloc>()
                                      .rReferralCodeController
                                      .text));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: size.width * 0.05),
                    ],
                  ),
                ),
              ),
              // ),
            );
          },
        ),
      ),
    );
  }
}
