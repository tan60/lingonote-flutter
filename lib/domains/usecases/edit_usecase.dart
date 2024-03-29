import 'package:intl/intl.dart';
import 'package:lingonote/datas/models/note_model.dart';
import 'package:lingonote/datas/repositories/local_service.dart';
import 'package:lingonote/domains/entities/note_entity.dart';
import 'package:lingonote/domains/managers/pref_mgr.dart';

class EditUsecase {
  static EditUsecase? _instance;
  late final int userUid;

  factory EditUsecase() {
    _instance ??= EditUsecase._internal();

    return _instance!;
  }

  EditUsecase._internal() {
    userUid = PrefMgr.prefs.getInt(PrefMgr.uid) ?? -1;
  }

  Future postOrUpdateNote(NoteEntity note) async {
    var now = DateTime.now();
    String issueDate = DateFormat('yyyy-MM-dd').format(now);

    NoteModel noteModel = NoteModel(
      postNo: note.postNo,
      topic: note.topic,
      contents: note.contents,
      issueDate: issueDate,
      issueDateTime: note.dateTime,
      fixedDateTime: note.dateTime,
      improved: note.improved,
      improvedType: note.improvedType,
      userUid: userUid,
    );

    NoteModel postedNote;

    if (note.postNo == null) {
      postedNote = await LocalService().postNote(noteModel);
    } else {
      postedNote = await LocalService().updateNote(noteModel);
    }

    return NoteEntity(
      postNo: postedNote.postNo,
      topic: postedNote.topic,
      contents: postedNote.contents,
      dateTime: postedNote.issueDateTime,
      improved: postedNote.improved,
      improvedType: postedNote.improvedType,
    );
  }

  Future updateNote(NoteEntity note) async {
    var now = DateTime.now();
    String issueDate = DateFormat('yyyy-MM-dd').format(now);

    NoteModel noteModel = NoteModel(
      postNo: note.postNo,
      topic: note.topic,
      contents: note.contents,
      issueDate: issueDate,
      issueDateTime: note.dateTime,
      fixedDateTime: note.dateTime,
      improved: note.improved,
      improvedType: note.improvedType,
      userUid: userUid,
    );

    NoteModel postedNote = await LocalService().updateNote(noteModel);

    return NoteEntity(
      postNo: postedNote.postNo,
      topic: postedNote.topic,
      contents: postedNote.contents,
      dateTime: postedNote.issueDateTime,
      improved: postedNote.improved,
      improvedType: postedNote.improvedType,
    );
  }
}
