library;

import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

part 'create_public_list.dart';

part 'get_my_lists.dart';

part 'add_movie_to_list.dart';

part 'create_review.dart';

class ExampleConnector {
  CreatePublicListVariablesBuilder createPublicList({
    required String name,
    required String description,
  }) {
    return CreatePublicListVariablesBuilder(
      dataConnect,
      name: name,
      description: description,
    );
  }

  GetMyListsVariablesBuilder getMyLists() {
    return GetMyListsVariablesBuilder(dataConnect);
  }

  AddMovieToListVariablesBuilder addMovieToList({
    required String listId,
    required String movieId,
    required int position,
  }) {
    return AddMovieToListVariablesBuilder(
      dataConnect,
      listId: listId,
      movieId: movieId,
      position: position,
    );
  }

  CreateReviewVariablesBuilder createReview({
    required String movieId,
    required int rating,
    required String review,
  }) {
    return CreateReviewVariablesBuilder(
      dataConnect,
      movieId: movieId,
      rating: rating,
      review: review,
    );
  }

  static ConnectorConfig connectorConfig = ConnectorConfig(
    'us-east4',
    'example',
    'googleauth',
  );

  ExampleConnector({required this.dataConnect});
  static ExampleConnector get instance {
    return ExampleConnector(
      dataConnect: FirebaseDataConnect.instanceFor(
        connectorConfig: connectorConfig,
        sdkType: CallerSDKType.generated,
      ),
    );
  }

  FirebaseDataConnect dataConnect;
}
