import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app_core/todos_app_core.dart';

import '../blocs/bloc.dart';
import '../localization.dart';
import '../models/app_tab.dart';
import '../widgets/extra_action.dart';
import '../widgets/filter_button.dart';
import '../widgets/filtered_todos.dart';
import '../widgets/stats.dart';
import '../widgets/tab_selector.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          appBar: AppBar(
            title: Text(FlutterBlocLocalizations.of(context).appTitle),
            actions: [
              FilterButton(visible: activeTab == AppTab.todos),
              ExtraActions(),
            ],
          ),
          body: activeTab == AppTab.todos ? FilteredTodos() : Stats(),
          floatingActionButton: FloatingActionButton(
            key: ArchSampleKeys.addTodoFab,
            onPressed: () {
              Navigator.pushNamed(context, ArchSampleRoutes.addTodo);
            },
            child: Icon(Icons.add),
            tooltip: ArchSampleLocalizations.of(context).addTodo,
          ),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) => BlocProvider.of<TabBloc>(context).add(
              TabUpdated(tab),
            ),
          ),
        );
      },
    );
  }
}
