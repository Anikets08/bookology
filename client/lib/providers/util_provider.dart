import 'package:bookology/common/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

final hiveProvider = StateProvider((ref) => Hive.box(kAppStorage));
final genreProvider = StateProvider((ref) => "All");
