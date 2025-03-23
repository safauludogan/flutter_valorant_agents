part of '../agent_detail_view.dart';

class _AgentName extends StatelessWidget {
  const _AgentName({
    required this.agentName,
    this.opacity,
    this.style,
  });

  final double? opacity;
  final String agentName;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity ?? 1,
      duration: const ProjectDurations.lowDuration(),
      child: Text(
        agentName,
        style: style ?? AppTextStyles.bodyText1,
      ),
    );
  }
}
