import 'package:eco_ideas/features/home/presentation/controller/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  HomeState build() {
    return HomeState.explore;
  }

  void change(int index) {
    state = HomeState.values[index];
  }
}
