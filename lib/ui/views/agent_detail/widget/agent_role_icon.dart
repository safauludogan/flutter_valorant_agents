part of '../agent_detail_view.dart';

class _AgentRoleIcon extends StatelessWidget {
  const _AgentRoleIcon({
    required this.imageUrl,
    super.key,
  });

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return CustomNetworkImage(
      imageUrl: imageUrl,
      size: Size(24.w, 24.h),
    );
  }
}
