import 'package:lingonote/data/models/note_model.dart';
import 'package:lingonote/data/repositories/api_blueprint.dart';

class MockService extends ApiBlueprint {
  @override
  Future<List<NoteModel>>? fetchMyNotes(int userUid) async {
    return await Future<List<NoteModel>>.delayed(const Duration(seconds: 1),
        () {
      List<NoteModel> notes = [];

      for (int i = 0; i < 15; i++) {
        NoteModel note = NoteModel(
          topic: 'title $i',
          contents:
              'This is contents for dummy data, and it looks like card or stuff like that $i',
          issueDate: '202202271301',
          fixedDate: '202202271301',
          userUid: 1234567890123456,
          improved: "",
          improvedType: "",
        );
        //notes.add(note);
      }

      return notes;
    });
  }

  @override
  Future? postNote(NoteModel note) {
    return null;
  }
}