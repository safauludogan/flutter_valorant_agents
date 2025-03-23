part of '../agent_detail_view.dart';

class _AgentRoleName extends StatelessWidget {
  const _AgentRoleName({
    required this.roleName,
  });

  final String roleName;

  @override
  Widget build(BuildContext context) {
    return Text(
      roleName,
      style: AppTextStyles.footNote2.copyWith(
        color: Colors.white.withValues(alpha: 0.8),
      ),
    );
  }
}
