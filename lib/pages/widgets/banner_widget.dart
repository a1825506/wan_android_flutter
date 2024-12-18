import 'package:flutter/cupertino.dart';

import '../../models/banner_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget{
  final List<BannerItem> bannerList;
  final Function(BannerItem) onClick;
  final Function(int index,CarouselPageChangedReason reason)? onChange;

  const BannerWidget({
    super.key,
    required this.bannerList,
    required this.onClick,
    this.onChange
});

  @override
  State<StatefulWidget> createState() => _BannerState();
}

class _BannerState extends State<BannerWidget>{

  @override
  Widget build(BuildContext context) {
    if(widget.bannerList.isEmpty) {
      return Container();
    }

    return CarouselSlider.builder(
        itemCount: widget.bannerList.length,
        itemBuilder: (BuildContext content,int itemIndex,int pageViewIndex) => Container(
          child: InkWell(
            onTap: (){
              var item = widget.bannerList[itemIndex];
              widget.onClick(item);
            },
            child: Image.network(widget.bannerList[itemIndex].imagePath),
          ),
        ),
        options: CarouselOptions(
          // height: 250, // 不指定固定高度，使用比例指定
          aspectRatio: 16 / 9,
          // viewportFraction: 0.8, // 卡片切换
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: widget.onChange,
          scrollDirection: Axis.horizontal,
        ));
  }
}