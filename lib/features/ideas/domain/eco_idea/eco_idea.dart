import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
part 'eco_idea.freezed.dart';
part 'eco_idea.g.dart';

@freezed
class EcoIdea with _$EcoIdea {
  const factory EcoIdea({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    required String title,
    required String description,
    List<String>? requirments,
    List<String>? benefits,
  }) = _EcoIdea;

  factory EcoIdea.fromJson(Map<String, dynamic> json) =>
      _$EcoIdeaFromJson(json);

  factory EcoIdea.create(
          {required String userId,
          required String title,
          String description = '',
          List<String>? requirments,
          List<String>? benefits}) =>
      EcoIdea(
          id: const Uuid().v4(),
          userId: userId,
          title: title,
          description: description,
          requirments: requirments,
          benefits: benefits);
}
