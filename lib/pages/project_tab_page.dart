import 'package:flutter/cupertino.dart';
import 'package:wan_android_flutter/pages/widgets/articles_list_state.dart';

import '../providers/project_Tab_provider_new.dart';

class ProjectTabPage extends StatefulWidget{
  final String tabId;
  const ProjectTabPage({super.key,required this.tabId});

  @override
  State<StatefulWidget> createState() => _ProjectTabStateNew();
}

class _ProjectTabStateNew extends ArticlesListState<ProjectTabPage,ProjectTabProviderNew>{}