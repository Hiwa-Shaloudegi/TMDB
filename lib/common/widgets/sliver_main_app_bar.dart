import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SliverMainAppBar extends StatelessWidget {
  const SliverMainAppBar({
    super.key,
    required this.title,
    this.leading,
    this.trailing,
    this.actions,
  });

  final String title;
  final Widget? leading;
  final Widget? trailing;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      title: Text(title),
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: leading ??
              Transform.scale(
                scale: 0.4,
                child: SvgPicture.asset('assets/icons/back.svg'),
              ),
        ),
      ),
      actions: actions ??
          [
            trailing ?? const SizedBox(),
          ],
    );
  }
}
