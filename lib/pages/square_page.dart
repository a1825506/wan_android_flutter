import 'package:flutter/cupertino.dart';
import 'package:wan_android_flutter/common/my_color.dart';
import 'package:wan_android_flutter/pages/widgets/articles_list_state.dart';

import '../providers/square_provider.dart';

class SquarePage extends StatefulWidget{
  const SquarePage({super.key});

  @override
  State<StatefulWidget> createState() => _SquareState();
}

class _SquareState extends State<SquarePage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: MyColor.wxBackground,
      child: SquareContainerPage(),
    );
  }
}

class SquareContainerPage extends StatefulWidget{
  const SquareContainerPage({super.key});

  @override
  State<StatefulWidget> createState() => _SquareContainerState();
}

class _SquareContainerState extends ArticlesListState<SquarePage,SquareProvider>{
}