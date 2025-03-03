import 'package:eco_ideas/features/idea/data/idea_repository.dart';
import 'package:eco_ideas/features/idea/idea.dart';
import 'package:eco_ideas/features/user/data/data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_ideas_controller.g.dart';

@riverpod
class MyIdeasController extends _$MyIdeasController {
  @override
  Future<List<Idea>> build() async {
    final userId = ref.read(userRepositoryProvider).currentUser!.id;
    final ideas = await ref.read(ideaRepositoryProvider).getUserIdeas(userId);
    return ideas;
  }
}
