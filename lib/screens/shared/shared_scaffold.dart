import 'package:flutter/material.dart';
import '/core/colors.dart';
import '/screens/shared/text.dart';

class SharedScaffold extends StatelessWidget {
  final String? title;
  final Widget body;
  final Widget? bottomNavigationBar;

  const SharedScaffold(
      {Key? key, this.title, required this.body, this.bottomNavigationBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationColors.light,
      // TODO: Handle the drawer
      // drawer: Drawer(
      //   child: Column(
      //     mainAxisSize: MainAxisSize.max,
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [],
      //   ),
      // ),
      appBar: (title != null)
          ? AppBar(
              backgroundColor: Colors.transparent,
              title: ApplicationText(
                text: title!,
                color: ApplicationColors.dark,
                size: 24,
                weight: FontWeight.w600,
              ),
            )
          : null,
      bottomNavigationBar: bottomNavigationBar,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: body,
      ),
    );
  }
}
