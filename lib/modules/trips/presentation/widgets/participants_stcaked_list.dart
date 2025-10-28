import 'package:flutter/material.dart';
import 'package:reckit_task/core/config/theme/custom_colors.dart';
import 'package:reckit_task/modules/trips/domain/entities/participant_entity.dart';

class ParticipantsStack extends StatelessWidget {
  final List<ParticipantEntity> participants;


  static const double _avatarRadius = 16;
  static const double _avatarOverlap = 20;
  static const double _statusFontSize = 12;
  static const int _maxVisibleAvatars = 3;

  const ParticipantsStack({
    super.key,
    required this.participants,
  });

  @override
  Widget build(BuildContext context) {
    final visibleCount = participants.length.clamp(0, _maxVisibleAvatars);
    final remainingCount = participants.length > _maxVisibleAvatars ? participants.length - _maxVisibleAvatars : 0;

    final totalWidth = visibleCount * _avatarOverlap + (remainingCount > 0 ? _avatarRadius * 2 : _avatarRadius);

    return SizedBox(
      width: totalWidth,
      height: _avatarRadius * 2,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for (int i = 0; i < visibleCount; i++)
            _buildAvatar(
              context,
              left: i * _avatarOverlap,
              imageUrl: participants[i].avatarUrl,
            ),
          if (remainingCount > 0)
            _buildRemainingCount(
              context,
              left: visibleCount * _avatarOverlap,
              count: remainingCount,
            ),
        ],
      ),
    );
  }

  /// Builds an individual participant avatar with a border.
  Widget _buildAvatar(
    BuildContext context, {
    required double left,
    String? imageUrl,
  }) {
    return Positioned(
      left: left,
      child: _buildAvatarContainer(
        context,
        child: CircleAvatar(
          radius: _avatarRadius,
          backgroundColor: Colors.grey[700],
          backgroundImage: (imageUrl != null && imageUrl.isNotEmpty) ? NetworkImage(imageUrl) : null,
        ),
      ),
    );
  }

  /// Builds the "+N" avatar when there are more participants.
  Widget _buildRemainingCount(
    BuildContext context, {
    required double left,
    required int count,
  }) {
    final colors = Theme.of(context).extension<CustomColors>();
    return Positioned(
      left: left,
      child: _buildAvatarContainer(
        context,
        child: CircleAvatar(
          radius: _avatarRadius,
          backgroundColor: Theme.of(context).dividerColor,
          child: Text(
            '+$count',
            style: TextStyle(
              color: colors?.warningColor,
              fontSize: _statusFontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  /// Common container for border styling around avatars.
  Widget _buildAvatarContainer(BuildContext context, {required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).dividerColor,
          width: 1,
        ),
      ),
      child: child,
    );
  }
}
