part of '../agent_detail_view.dart';

class _AgentBg extends StatelessWidget {
  const _AgentBg({
    required this.imageUrl,
    super.key,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: RoleBgDecoration(),
      child: CustomNetworkImage(
        imageUrl: imageUrl,
        size: Size(1.w, 1.h),
        networkCache: const CustomNetworkCache(height: 700, width: 1024),
      ),
    );
  }
}
