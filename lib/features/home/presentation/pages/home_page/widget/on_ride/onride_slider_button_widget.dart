import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../common/common.dart';
import '../../../../../../../core/model/user_detail_model.dart';
import '../../../../../../../core/utils/custom_slider/custom_sliderbutton.dart';
import '../../../../../../../core/utils/custom_text.dart';
import '../../../../../../../l10n/app_localizations.dart';
import '../../../../../application/home_bloc.dart';

class OnrideCustomSliderButtonWidget extends StatelessWidget {
  final Size size;
  
  const OnrideCustomSliderButtonWidget({
    super.key,
    required this.size,
  });


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Column(
              children: [
                CustomSliderButton(
                  sliderIcon: Icon(
                    Icons.keyboard_double_arrow_right_rounded,
                    color: AppColors.white,
                    size: size.width * 0.07,
                  ),
                  buttonName: (userData!.onTripRequest!.arrivedAt == null)
                      ? AppLocalizations.of(context)!.arrived
                      : (userData!.onTripRequest!.isTripStart == 0)
                          ? (userData!.onTripRequest!.transportType == 'taxi')
                              ? AppLocalizations.of(context)!.startRide
                              : AppLocalizations.of(context)!.pickGoods
                          : (userData!.onTripRequest!.transportType == 'taxi')
                              ? AppLocalizations.of(context)!.endRide
                              : AppLocalizations.of(context)!.dispatchGoods,
                  onSlideSuccess: () async {
                    if (userData != null && userData!.onTripRequest != null) {
                      if (userData!.onTripRequest!.requestStops.isNotEmpty &&
                          userData!.onTripRequest!.isTripStart == 1 &&
                          userData!.onTripRequest!.requestStops
                                  .where((e) => e['completed_at'] == null)
                                  .length >
                              1) {
                        context.read<HomeBloc>().add(ShowChooseStopEvent());
                      } else if (userData!.onTripRequest!.arrivedAt == null) {
                        context.read<HomeBloc>().add(RideArrivedEvent(
                            requestId: userData!.onTripRequest!.id));
                      } else if (userData!.onTripRequest!.isTripStart == 0) {
                        if (userData!.onTripRequest!.showOtpFeature == true) {
                          context.read<HomeBloc>().add(ShowOtpEvent());
                        } else {
                          if (userData!.onTripRequest!.transportType ==
                                  'delivery' &&
                              userData!.onTripRequest!.enableShipmentLoad ==
                                  '1') {
                            context.read<HomeBloc>().add(ShowImagePickEvent());
                          } else {
                            context.read<HomeBloc>().add(RideStartEvent(
                                requestId: userData!.onTripRequest!.id,
                                otp: '',
                                pickLat: userData!.onTripRequest!.pickLat,
                                pickLng: userData!.onTripRequest!.pickLng));
                          }
                        }
                      } else {
                        if (userData!.onTripRequest!.transportType ==
                                'delivery' &&
                            userData!.onTripRequest!.enableShipmentUnload ==
                                '1') {
                          context.read<HomeBloc>().add(ShowImagePickEvent());
                        } else if (userData!.onTripRequest!.transportType ==
                                'delivery' &&
                            userData!.onTripRequest!.enableDigitalSignature ==
                                '1') {
                          context.read<HomeBloc>().add(ShowSignatureEvent());
                        } else {
                          // if (userData!.onTripRequest!.isBidRide != '1' &&
                          //     userData!.onTripRequest!.isRental == false &&
                          //     userData!.onTripRequest!.isOutstation != 1 &&
                          //     userData!.onTripRequest!.dropAddress != null &&
                          //     double.parse(
                          //             (context.read<HomeBloc>().tripDistance /
                          //                     1000)
                          //                 .toStringAsFixed(2)) >
                          //         double.parse(
                          //             userData!.onTripRequest!.totalDistance)) {
                          //   context.read<HomeBloc>().add(PolylineEvent(
                          //       pickLat: userData!.onTripRequest!.pickLat,
                          //       pickLng: userData!.onTripRequest!.pickLng,
                          //       dropLat: context
                          //           .read<HomeBloc>()
                          //           .currentLatLng!
                          //           .latitude,
                          //       dropLng: context
                          //           .read<HomeBloc>()
                          //           .currentLatLng!
                          //           .longitude,
                          //       stops: [],
                          //       packageName: AppConstants.packageName,
                          //       signKey: AppConstants.signKey,
                          //       pickAddress:
                          //           userData!.onTripRequest!.pickAddress,
                          //       dropAddress:
                          //           userData!.onTripRequest!.dropAddress ?? '',
                          //       isTripEndCall: true));
                          // } else {
                            if (userData!.onTripRequest!.isRental == false &&
                                userData!.onTripRequest!.isOutstation != 1 &&
                                userData!.onTripRequest!.dropAddress != null) {
                              context.read<HomeBloc>().add(RideEndEvent(
                                  isAfterGeoCodeEnd: false,
                                  isAfterRoutesDistanceCall: false));
                            } else {
                              context.read<HomeBloc>().add(GeocodingLatLngEvent(
                                  lat: context
                                      .read<HomeBloc>()
                                      .currentLatLng!
                                      .latitude,
                                  lng: context
                                      .read<HomeBloc>()
                                      .currentLatLng!
                                      .longitude));
                            }
                          // }
                        }
                      }
                      return true;
                    }
                    return null;
                  },
                ),
                if (userData!.onTripRequest!.isTripStart == 0) ...[
                  SizedBox(height: size.width * 0.05),
                  InkWell(
                    onTap: () {
                      context.read<HomeBloc>().add(GetCancelReasonEvent());
                    },
                    child: MyText(
                        text: AppLocalizations.of(context)!.cancelRide,
                        textStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: AppColors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            )),
                  )
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
