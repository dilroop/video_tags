import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

import '../extensions/text_style_extension.dart';
import '../localizations.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  late FocusNode editTextNode;

  @override
  void initState() {
    super.initState();
    editTextNode = FocusNode();
  }

  @override
  void dispose() {
    editTextNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: GradientText(
          widget.title,
          gradient: Gradients.coldLinear,
          style: GoogleFonts.damionTextTheme().headline4!.withSize(52),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [urlInputHeader(theme, localization)],
        ),
      ),
    );
  }

  Widget urlInputHeader(ThemeData theme, AppLocalizations localization) {
    TextEditingController controller = TextEditingController();
    return SizedBox(
      height: 80,
      child: Card(
        color: theme.colorScheme.surface,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: TextField(
                  autofocus: true,
                  maxLines: 1,
                  controller: controller,
                  focusNode: editTextNode,
                  style: TextStyle(
                    backgroundColor: theme.colorScheme.surface,
                    color: theme.colorScheme.onSurface,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    hintText: localization.videoUrlHint,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                print("FlatButton");
              },
              child: Text(
                localization.loadVideoButtonText,
                style: TextStyle(color: theme.colorScheme.onPrimary),
              ),
              style: TextButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
