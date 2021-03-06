import 'package:flutter/material.dart';

class AutoHideKeyboard extends StatelessWidget {
  final Widget child;

  const AutoHideKeyboard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void hideKeyboard() {
      final currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    return GestureDetector(
      onTap: hideKeyboard,
      // onTapDown: (_) => hideKeyboard(),
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }
}

class ScaffoldHideKeyboard extends Scaffold {
  ScaffoldHideKeyboard({
    Key? key,
    required Widget body,
    bool resizeToAvoidBottomInset = true,
  }) : super(
            key: key,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            body: AutoHideKeyboard(
              child: body,
            ));
}
