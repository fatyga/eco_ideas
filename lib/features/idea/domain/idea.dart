import 'package:eco_ideas/features/idea/idea.dart';
import 'package:eco_ideas/features/user/user.dart';
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
    @JsonKey(name: IdeaTable.id) required String id,
    @JsonKey(name: IdeaTable.userId) required String userId,
    @JsonKey(name: IdeaTable.title) String? title,
    @JsonKey(name: IdeaTable.description) String? description,
    @JsonKey(name: IdeaTable.published) @Default(false) bool published,
    @JsonKey(name: IdeaTable.imageUrl) String? imageUrl,
    @JsonKey(name: IdeaTable.essentials)
    @Default(<String>[])
    List<String> essentials,
    @JsonKey(name: IdeaTable.steps, includeToJson: false)
    @JsonKey(name: IdeaTable.steps)
    @Default(<IdeaStep>[])
    List<IdeaStep> steps,
  }) = _Idea;

  factory Idea.empty({required String userId}) {
    final id = const Uuid().v4();
    return Idea(id: id, userId: userId);
  }

  factory Idea.fromJson(Map<String, Object?> json) => _$IdeaFromJson(json);
}
