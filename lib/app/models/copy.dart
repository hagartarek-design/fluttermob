class ExamResult {
  final int total;
  final double solvedPercent;
  final double truePercent;
  final double falsePercent;
  final double restPercent;
  final int degree;
  final double solved;
  final int rest;
  final int falseans;
  final int trueans;
  final ChooseResult choose;

  ExamResult({
    required this.total,
    required this.solvedPercent,
    required this.truePercent,
    required this.falseans,
    required this.falsePercent,
    required this.solved,
    required this.restPercent,
    required this.rest,
    required this.degree,
    required this.trueans,
    required this.choose,
  });

  factory ExamResult.fromJson(Map<String, dynamic> json) {
    return ExamResult(
      total: json['total'] ?? 0,
      solvedPercent: (json['solvedPercent'] ?? 0.0).toDouble(),
      solved: (json['solved'] ?? 0.0).toDouble(),
      truePercent: (json['truePercent'] ?? 0.0).toDouble(),
      restPercent: (json['restPercent'] ?? 0.0).toDouble(),
      falsePercent: (json['falsePercent'] ?? 0.0).toDouble(),
      degree: json['degree'] ?? 0,
      trueans: (json['trueans'] ?? 0),
      rest: (json['rest'] ?? 0),
      falseans: (json['falseans'] ?? 0),
      choose: ChooseResult.fromJson(json['choose'] ?? {}),
    );
  }
}

class ChooseResult {
  final double truePercent;
  final double falsePercent;

  ChooseResult({
    required this.truePercent,
    required this.falsePercent,
  });

  factory ChooseResult.fromJson(Map<String, dynamic> json) {
    return ChooseResult(
      truePercent: (json['truePercent'] ?? 0).toDouble(),
      falsePercent: (json['falsePercent'] ?? 0).toDouble(),
    );
  }
}
