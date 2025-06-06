import 'package:eco_ideas/features/idea/idea.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'idea.freezed.dart';

part 'idea.g.dart';

class IdeaTable {
  static const String tableName = 'idea';
  static const String id = 'id';
  static const String userId = 'user_id';
  static const String title = 'title';
  static const String description = 'description';
  static const String published = 'published';
  static const String imageUrl = 'image_url';
  static const String essentials = 'essentials';
  static const String steps = 'steps';
}

@freezed
class Idea with _$Idea {
  const factory Idea({
    required String id,
    @JsonKey(name: IdeaTable.userId) required String userId,
    String? title,
    String? description,
    @Default(false) bool published,
    @JsonKey(name: IdeaTable.imageUrl) String? imageUrl,
    @Default(<String>[]) List<String> essentials,
    @JsonKey(name: IdeaTable.steps, includeToJson: false)
    @Default(<IdeaStep>[])
    List<IdeaStep> steps,
  }) = _Idea;

  factory Idea.empty({required String userId}) {
    final id = const Uuid().v4();
    return Idea(
      id: id,
      userId: userId,
    );
  }

  factory Idea.fromJson(Map<String, Object?> json) => _$IdeaFromJson(json);
}
