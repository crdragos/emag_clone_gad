library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:emag_clone_gad/src/models/auth/index.dart';
import 'package:emag_clone_gad/src/models/index.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[
  AppState,
  AuthState,
  AppUser,
  ProductReview,
])
Serializers serializers = (_$serializers.toBuilder() //
      ..addPlugin(StandardJsonPlugin())
    //
    )
    .build();
