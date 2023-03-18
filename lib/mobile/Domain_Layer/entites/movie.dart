class Movie {
  final int id;
  final String title;
  final String backdropPath;
  final String overview;
  final double voteAvg;
  final List<int> generIds;

   Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.overview,
    required this.voteAvg,
    required this.generIds,});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          backdropPath == other.backdropPath &&
          overview == other.overview &&
          voteAvg == other.voteAvg &&
          generIds == other.generIds;
//override or use package Equatable
  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      backdropPath.hashCode ^
      overview.hashCode ^
    //  voteAvg.hashCode ^
      generIds.hashCode;
}
