import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:skillswap/swipecard/models/swipecard.dart';

part 'swipecard_repository.g.dart';

@riverpod
SwipecardRepository swipecardRepository(SwipecardRepositoryRef _) => SwipecardRepository();

class SwipecardRepository {
  final _client = Supabase.instance.client;

  Future<List<Swipecard>> getSwipecard() => _client
      .from('swipe_card')
      .select('card_id, user_id, username, skill_name, interested_skill_name, skill_id, interested_skill_id')
      .then((data) => data.map((json) => Swipecard.fromJson(json)).toList());
}
