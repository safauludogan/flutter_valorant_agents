import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_valorant_agents/product/manager/network_error_resolver.dart';
import 'package:flutter_valorant_agents/ui/styles/text_styles.dart';
import 'package:gen/gen.dart';
import 'package:stacked/stacked.dart';

import 'agent_detail_viewmodel.dart';

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
    viewModel.getAgent(agentId: agentId);
  }

  @override
  Widget builder(
    BuildContext context,
    AgentDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: viewModel.isBusy
          ? const LoadingCircular()
          : NetworkErrorResolver(
              error: viewModel.getError,
              child: _buildContent(context, viewModel),
            ).resolveErrorWidget(
              receiveData: () => viewModel.getAgent(agentId: agentId),
            ),
    );
  }

  Widget _buildContent(BuildContext context, AgentDetailViewModel viewModel) {
    final agent = viewModel.agent;
    if (agent == null) return const SizedBox.shrink();

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 500.h,
          pinned: true,
          backgroundColor: Colors.transparent,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                if (agent.background != null)
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0.2,
                      child: CustomNetworkImage(
                        imageUrl: agent.background,
                        size: Size(1.w, 1.h),
                        networkCache:
                            const CustomNetworkCache(height: 700, width: 1024),
                      ),
                    ),
                  ),
                // Agent full portrait
                Positioned.fill(
                  child: Hero(
                    tag: agent.uuid ?? '',
                    child: CustomNetworkImage(
                      imageUrl: agent.fullPortrait ?? '',
                      size: Size(1.w, 500.h),
                      networkCache:
                          const CustomNetworkCache(height: 1024, width: 930),
                    ),
                  ),
                ),

                // Bottom gradient for text readability
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 150.h,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
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
                          Text(
                            agent.displayName ?? '',
                            style: AppTextStyles.headline1.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          if (agent.role?.displayIcon != null) ...[
                            SizedBox(width: 12.w),
                            CustomNetworkImage(
                              imageUrl: agent.role!.displayIcon!,
                              size: Size(24.w, 24.h),
                            ),
                          ],
                        ],
                      ),
                      if (agent.role?.displayName != null) ...[
                        SizedBox(height: 4.h),
                        Text(
                          agent.role!.displayName!,
                          style: AppTextStyles.footNote2.copyWith(
                            color: Colors.white.withOpacity(0.8),
                          ),
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
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Description
                Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    agent.description ?? '',
                    style: AppTextStyles.bodyText2.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),

                // Abilities section
                Text(
                  'Yetenekler',
                  style: AppTextStyles.headline2.copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.h),

                if (agent.abilities != null) _buildAbilities(agent.abilities!),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAbilities(List<Abilities> abilities) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: abilities.length,
      separatorBuilder: (_, __) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        final ability = abilities[index];
        return Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (ability.displayIcon != null)
                    Container(
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: CustomNetworkImage(
                        imageUrl: ability.displayIcon!,
                        size: Size(48.w, 48.h),
                      ),
                    ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Text(
                      ability.displayName ?? '',
                      style: AppTextStyles.bodyText1.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              if (ability.description != null) ...[
                SizedBox(height: 12.h),
                Text(
                  ability.description!,
                  style: AppTextStyles.footNote2.copyWith(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  @override
  AgentDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AgentDetailViewModel();
}
