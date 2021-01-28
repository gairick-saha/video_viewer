import 'package:flutter/material.dart';
import 'package:video_viewer/data/repositories/video.dart';

class SecondaryMenu extends StatelessWidget {
  const SecondaryMenu({
    Key key,
    this.children,
    this.closeMenu,
  }) : super(key: key);

  final List<Widget> children;
  final void Function() closeMenu;

  @override
  Widget build(BuildContext context) {
    final metadata = VideoQuery().videoMetadata(context, listen: true);
    final style = metadata.style.settingsStyle;

    return Center(
      child: Container(
        width: 150,
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: closeMenu,
              child: Row(children: [
                style.chevron,
                Expanded(
                  child: Text(
                    metadata.language.settings,
                    style: metadata.style.textStyle,
                  ),
                ),
              ]),
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}
