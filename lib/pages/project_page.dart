import 'package:flutter/cupertino.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProjectState();
}

class _ProjectState extends State<ProjectPage>{
  @override
  Widget build(BuildContext context) {
    return Text("项目");
  }
}
