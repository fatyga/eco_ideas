import 'package:eco_ideas/features/idea/idea.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'idea.freezed.dart';

part 'idea.g.dart';

@freezed
class Idea with _$Idea {
  const factory Idea({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    String? title,
    String? description,
    @Default(false) bool published,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(includeToJson: false) @Default(<IdeaStep>[]) List<IdeaStep> steps,
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
