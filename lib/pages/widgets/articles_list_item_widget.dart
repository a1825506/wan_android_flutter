import 'package:flutter/material.dart';
import '../../utils/html_extensions.dart';

import '../../models/article_item.dart';

class ListItem extends StatelessWidget {
  final ArticleItem item;
  final int index;
  final VoidCallback onClick;

  ListItem({
    super.key,
    required this.item,
    required this.index,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  item.niceDate ?? "",
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                // 填充
                // Expanded 将子项扩展以填充父容器剩余的空间
                // Flexible 类似于 Expanded，但允许子项根据自己的内容自适应，只有在有剩余空间时才分配（子项有自己的大小时不填充）
                Expanded(
                  // flex: 1, // 分配剩余的空间的比例
                  child: SizedBox(width: 8),
                ),
                Text(
                  item.superChapterName == "广场Tab" ? "分享人: ${item.shareUser}" : "作者: ${item.author}",
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (item.envelopePic != null && item.envelopePic!.isNotEmpty) ...[
                  // ... 是 Dart 的 集合展开操作符，可以用于将列表、集合或映射的内容插入到另一个集合中
                  ClipRRect( // ClipRRect 实现圆角
                    // borderRadius: BorderRadius.all(Radius.circular(10)), // BorderRadius.only 可以设置四个角
                    borderRadius: BorderRadius.circular(10), // all
                    child: Image.network(
                      item.envelopePic!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title?.htmlDecode() ?? "",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 10),
                      if (item.desc != null && item.desc!.isNotEmpty)
                        Text(
                          item.desc!.htmlDecode(),
                          style: TextStyle(fontSize: 16),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${item.superChapterName}/${item.chapterName?.htmlDecode() ?? ""}',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    if (item.tags != null && item.tags!.isNotEmpty)
                      Text(
                        item.tags!.map((tag) => tag.name).join('/'),
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                '[ ${index + 1} ]',
                style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.3)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
