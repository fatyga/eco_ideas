import 'package:freezed_annotation/freezed_annotation.dart';
part 'eco_idea.freezed.dart';
part 'eco_idea.g.dart';

@freezed
class EcoIdea with _$EcoIdea {
  const factory EcoIdea({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    required String title,
    required String description,
  }) = _EcoIdea;

  factory EcoIdea.fromJson(Map<String, dynamic> json) =>
      _$EcoIdeaFromJson(json);
}
