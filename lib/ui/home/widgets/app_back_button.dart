import 'package:chef_wizz/gen/assets.gen.dart';
import 'package:chef_wizz/ui/ui.dart';
import 'package:flutter/cupertino.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: ShapeDecoration(
        color: whiteColor.withOpacity(0.12),
        shape: CircleBorder(
          side: BorderSide(
            color: greyColor.withOpacity(0.2),
          ),
        ),
      ),
      alignment: Alignment.center,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: context.router.maybePop,
        child: AppAssets.images.arrowLeft.svg(),
      ),
    );
  }
}
