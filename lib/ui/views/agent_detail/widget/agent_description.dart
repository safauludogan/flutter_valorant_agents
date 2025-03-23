part of '../agent_detail_view.dart';

class _AgentDescription extends StatelessWidget {
  const _AgentDescription({
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Paddings.p16a,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        description,
        style: AppTextStyles.bodyText2.copyWith(
          color: Colors.white.withValues(alpha: 0.9),
        ),
      ),
    );
  }
}
