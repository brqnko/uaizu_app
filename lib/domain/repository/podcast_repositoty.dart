import 'dart:typed_data';

import 'package:uaizu_app/domain/entity/podcast.dart';

abstract class PodcastRepository {
  Future<Uint8List> podcast(PodcastInput input);
}