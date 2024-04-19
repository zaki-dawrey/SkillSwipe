import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:skillswap/swipecard/swipecard.dart';

part 'swipecard_notifier.g.dart';

@riverpod
class SwipecardNotifier extends _$SwipecardNotifier {
  @override
  Future<List<Swipecard>> build() async {
    return ref.read(swipecardRepositoryProvider).getSwipecard();
  }
}
