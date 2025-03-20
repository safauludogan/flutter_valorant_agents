import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/ui/common/ui_helpers.dart';
import 'package:flutter_valorant_agents/ui/styles/paddings.dart';
import 'package:flutter_valorant_agents/ui/views/home/home_viewmodel.dart';
import 'package:flutter_valorant_agents/ui/views/home/mixin/home_view_mixin.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StackedView<HomeViewModel> with HomeViewMixin {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: Paddings.p16h,
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const BouncingScrollPhysics(),
            itemCount: viewModel.agents.length,
            itemBuilder: (context, index) {
              final agent = viewModel.agents[index];
              return Card(
                child: ListTile(
                  title: Text(agent.displayName ?? ''),
                  subtitle: Text(agent.description ?? ''),
                  leading: Image.network(agent.displayIcon ?? ''),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
