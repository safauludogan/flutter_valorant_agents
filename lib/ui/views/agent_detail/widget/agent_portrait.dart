part of '../agent_detail_view.dart';

class _AgentPortrait extends StatelessWidget {
  const _AgentPortrait({
    required this.imageUrl,
    required this.tag,
    super.key,
  });

  final String imageUrl;
  final String tag;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: CustomNetworkImage(
        imageUrl: imageUrl,
        size: Size(1.w, 500.h),
        networkCache: const CustomNetworkCache(height: 1024, width: 930),
      ),
    );
  }
}
