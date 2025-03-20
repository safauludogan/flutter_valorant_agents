part of '../home_view.dart';

/// Agents card list view
class _AgentsCardListView extends StatefulWidget {
  const _AgentsCardListView({required this.agents, Key? key}) : super(key: key);

  final List<Agent> agents;
  @override
  State<_AgentsCardListView> createState() => _AgentsCardListViewState();
}

class _AgentsCardListViewState extends State<_AgentsCardListView>
    with
        SingleTickerProviderStateMixin,
        MountedMixin<_AgentsCardListView>,
        FadeTransitionCurvedAnimateMixin<_AgentsCardListView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), startAnimation);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.agents.isEmpty) {
      return Center(
        child: Column(
          children: [
            const LottieNotFound(),
            Text(
              LocaleKeys.general_messages_noAgentsFound,
              style: AppTextStyles.footNote3,
            ).tr(),
          ],
        ),
      );
    }
    return buildAnimatedCard(
      child: ListView.builder(
        shrinkWrap: true,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.agents.length,
        itemBuilder: (context, index) {
          final agent = widget.agents[index];
          return Card(
            child: ListTile(
              title: Text(agent.displayName ?? ''),
              subtitle: Text(agent.description ?? ''),
              leading: CustomNetworkImage(
                imageUrl: agent.displayIcon,
                size: Size(
                  WidgetSizes.spacingXxl7.w,
                  WidgetSizes.spacingXxl7.h,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
