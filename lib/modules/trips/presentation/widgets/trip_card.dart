import 'package:flutter/material.dart';
import 'package:reckit_task/core/constants/app_strings.dart';
import 'package:reckit_task/core/constants/assets/icons_manager.dart';
import 'package:reckit_task/core/extensions/align_extension.dart';
import 'package:reckit_task/core/extensions/padding_extension.dart';
import 'package:reckit_task/core/extensions/size_extentions.dart';
import 'package:reckit_task/core/widgets/app_svg_image.dart';
import 'package:reckit_task/core/widgets/buttons/more_options_button.dart';
import 'package:reckit_task/modules/trips/domain/entities/trip_entity.dart';
import 'package:reckit_task/modules/trips/presentation/widgets/participants_stcaked_list.dart';
import 'package:reckit_task/modules/trips/presentation/widgets/trip_status_card.dart';
import '../../../../core/widgets/app_network_image.dart';

class TripCard extends StatelessWidget {
  const TripCard({super.key, required this.trip});
  final TripEntity trip;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final halfHeight = constraints.maxHeight * 0.5;
        return IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).cardColor,
            ),
            child: Stack(
              children: [
                _buildCoverImage(halfHeight),
                _buildGradientOverlay(context),
                MoreOptionsButton().alignTopEnd.allPadding(12.h),
                _buildTripInfo(
                  context,
                  constraints,
                ).topPadding(halfHeight - 20.h).horizontalPadding(12.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTripInfo(BuildContext context, BoxConstraints constraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TripStatusCard(title: trip.status ?? ""),
        SizedBox(height: 18),
        Text(trip.title ?? "", style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: 8),
        Row(
          children: [
            AppSvgImage(assetName: IconsManager.calendar),
            SizedBox(width: 4.h),
            SizedBox(
              width: constraints.maxWidth * 0.75,
              child: Text(
                '5 ${AppStrings.nights} (${trip.dates?.start ?? ""} - ${trip.dates?.end ?? ""})',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
        Divider().verticalPadding(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ParticipantsStack(participants: trip.participants ?? []),
            Text(
              '${trip.unfinishedTasks} ${AppStrings.unfinishedTasks}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }

  Container _buildGradientOverlay(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [
            Colors.transparent,
            Colors.transparent,
            Colors.transparent,
            Theme.of(context).cardColor.withValues(alpha: 0.5),
            Theme.of(context).cardColor,
          ],
        ),
      ),
    );
  }

  SizedBox _buildCoverImage(double halfHeight) {
    return SizedBox(
      height: halfHeight,
      child: AppNetworkImage(
        imageUrl: trip.coverImage ?? "",
        width: double.infinity,
        fit: BoxFit.cover,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
    );
  }
}
