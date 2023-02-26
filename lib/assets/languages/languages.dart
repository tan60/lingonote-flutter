import 'package:flutter/widgets.dart';

abstract class Languages {
  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages)!;
  }

  String get homeFeedGuide;

  String get homeFeedSubGuide;

  String get homeFeedAIGuide;

  String get editNoteAppBarTitle;

  String get tryWriting;
}
