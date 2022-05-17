final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [id, compl, closeQuiz];
  static final String id = '_id';
  static final String compl = 'compl';
  static final String closeQuiz = 'closeQuiz';
}

class Note {
  final int? id;
  final bool compl;
  final bool closeQuiz;

  const Note({
    this.id,
    required this.compl,
    required this.closeQuiz,
  });

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.compl: compl ? 1 : 0,
        NoteFields.closeQuiz: closeQuiz ? 1 : 0
      };

  Note copy({
    int? id,
    bool? compl,
    bool? closeQuiz,
  }) =>
      Note(
        id: id ?? this.id,
        compl: compl ?? this.compl,
        closeQuiz: closeQuiz ?? this.closeQuiz,
      );
  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int?,
        compl: json[NoteFields.compl] == 1,
        closeQuiz: json[NoteFields.closeQuiz] == 1,
      );
}
