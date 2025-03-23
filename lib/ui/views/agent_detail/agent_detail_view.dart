import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_valorant_agents/product/extension/context_extension.dart';
import 'package:flutter_valorant_agents/product/extension/double_extension.dart';
import 'package:flutter_valorant_agents/product/init/language/locale_keys.g.dart'
    show LocaleKeys;
import 'package:flutter_valorant_agents/product/manager/network_error_resolver.dart';
import 'package:flutter_valorant_agents/product/utility/constants/project_durations.dart';
import 'package:flutter_valorant_agents/product/utility/size/widget_size.dart';
import 'package:flutter_valorant_agents/product/widget/icon/favorite_icon_button.dart';
import 'package:flutter_valorant_agents/ui/styles/paddings.dart';
import 'package:flutter_valorant_agents/ui/views/agent_detail/agent_detail_viewmodel.dart';
import 'package:flutter_valorant_agents/ui/views/agent_detail/widget/decoration/ability_container_decoration.dart';
import 'package:flutter_valorant_agents/ui/views/agent_detail/widget/decoration/ability_icon_container_decoration.dart';
import 'package:flutter_valorant_agents/ui/views/home/widget/decoration/role_bg_decoration.dart';
import 'package:gen/gen.dart';
import 'package:stacked/stacked.dart';

part 'widget/agent_bg.dart';
part 'widget/agent_portrait.dart';
part 'widget/agent_role_icon.dart';
part 'widget/appbar_bottom_linear_shadow.dart';
part 'widget/appbar_title.dart';
part 'widget/agent_role_name.dart';
part 'widget/agent_description.dart';
part 'widget/agent_ability_title.dart';
part 'widget/ability_listview.dart';

class AgentDetailView extends StackedView<AgentDetailViewModel> {
  const AgentDetailView({
    required this.agentId,
    Key? key,
  }) : super(key: key);

  /// Agent ID
  final String agentId;

  @override
  void onViewModelReady(AgentDetailViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel
      ..getAgent(agentId: agentId)
      ..initialize();
  }

  @override
  void onDispose(AgentDetailViewModel viewModel) {
    super.onDispose(viewModel);
    viewModel.scrollController.dispose();
  }

  @override
  Widget builder(
    BuildContext context,
    AgentDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
          resizeToAvoidBottomInset: false,
      body: viewModel.isBusy
          ? const LoadingCircular()
          : NetworkErrorResolver(
              error: viewModel.getError,
              child: _buildContent(context, viewModel),
            ).resolveErrorWidget(
              context: context,
              receiveData: () => viewModel.getAgent(agentId: agentId),
            ),
    );
  }

  Widget _buildContent(BuildContext context, AgentDetailViewModel viewModel) {
    final agent = viewModel.agent;
    if (agent == null) return const SizedBox.shrink();

    return CustomScrollView(
      controller: viewModel.scrollController,
      slivers: [
        SliverAppBar(
          expandedHeight: 500.h,
          pinned: true,
          title: _AgentName(
            opacity: viewModel.opacity,
            agentName: agent.displayName!,
          ),
          // Scroll yapıldığında görünecek role icon
          actions: [
            if (agent.role?.displayIcon != null)
              AnimatedOpacity(
                opacity: viewModel.opacity,
                duration: const ProjectDurations.lowDuration(),
                child: Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: Container(
                    decoration: RoleBgDecoration(),
                    child: _AgentRoleIcon(imageUrl: agent.role!.displayIcon!),
                  ),
                ),
              ),
            Padding(
              padding: Paddings.p8r,
              child: FavoriteIconButton(
                onFavoriteTap: () => viewModel.onFavoriteTap(agent),
                isFavorite: viewModel.isFavorite,
              ),
            )
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                if (agent.background != null)
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0.2,
                      child: _AgentBg(imageUrl: agent.background!),
                    ),
                  ),
                // Agent full portrait
                Positioned.fill(
                  child: _AgentPortrait(
                    tag: agent.uuid ?? '',
                    imageUrl: agent.fullPortrait ?? '',
                  ),
                ),

                // Bottom gradient for text readability
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 150.h,
                  child: const _AppBarBottomLinearShadow(),
                ),
                // Agent name and role at bottom
                Positioned(
                  bottom: 20.h,
                  left: 16.w,
                  right: 16.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          _AgentName(
                            agentName: agent.displayName!,
                            style: context.textTheme.displayLarge,
                          ),
                          if (agent.role?.displayIcon != null) ...[
                            WidgetSizes.spacingS.w.width,
                            _AgentRoleIcon(imageUrl: agent.role!.displayIcon!),
                          ],
                        ],
                      ),
                      if (agent.role?.displayName != null) ...[
                        WidgetSizes.spacingXxs.h.height,
                        _AgentRoleName(
                          roleName: agent.role!.displayName!,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Content
        SliverToBoxAdapter(
          child: Padding(
            padding: Paddings.p16a,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _AgentDescription(description: agent.description!),
                WidgetSizes.spacingXxl2.h.height,
                const _AgentAbilityTitle(),
                if (agent.abilities != null)
                  _AbilityListView(abilities: agent.abilities!),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  AgentDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AgentDetailViewModel();
}
