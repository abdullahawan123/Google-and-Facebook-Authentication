part of 'generated.dart';

class CreateReviewVariablesBuilder {
  String movieId;
  int rating;
  String review;

  final FirebaseDataConnect _dataConnect;
  CreateReviewVariablesBuilder(
    this._dataConnect, {
    required this.movieId,
    required this.rating,
    required this.review,
  });
  Deserializer<CreateReviewData> dataDeserializer = (dynamic json) =>
      CreateReviewData.fromJson(jsonDecode(json));
  Serializer<CreateReviewVariables> varsSerializer =
      (CreateReviewVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateReviewData, CreateReviewVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateReviewData, CreateReviewVariables> ref() {
    CreateReviewVariables vars = CreateReviewVariables(
      movieId: movieId,
      rating: rating,
      review: review,
    );
    return _dataConnect.mutation(
      "CreateReview",
      dataDeserializer,
      varsSerializer,
      vars,
    );
  }
}

@immutable
class CreateReviewReviewInsert {
  final String id;
  CreateReviewReviewInsert.fromJson(dynamic json)
    : id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }

    final CreateReviewReviewInsert otherTyped =
        other as CreateReviewReviewInsert;
    return id == otherTyped.id;
  }

  @override
  int get hashCode => id.hashCode;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  const CreateReviewReviewInsert({required this.id});
}

@immutable
class CreateReviewData {
  final CreateReviewReviewInsert review_insert;
  CreateReviewData.fromJson(dynamic json)
    : review_insert = CreateReviewReviewInsert.fromJson(json['review_insert']);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }

    final CreateReviewData otherTyped = other as CreateReviewData;
    return review_insert == otherTyped.review_insert;
  }

  @override
  int get hashCode => review_insert.hashCode;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['review_insert'] = review_insert.toJson();
    return json;
  }

  const CreateReviewData({required this.review_insert});
}

@immutable
class CreateReviewVariables {
  final String movieId;
  final int rating;
  final String review;
  @Deprecated(
    'fromJson is deprecated for Variable classes as they are no longer required for deserialization.',
  )
  CreateReviewVariables.fromJson(Map<String, dynamic> json)
    : movieId = nativeFromJson<String>(json['movieId']),
      rating = nativeFromJson<int>(json['rating']),
      review = nativeFromJson<String>(json['review']);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }

    final CreateReviewVariables otherTyped = other as CreateReviewVariables;
    return movieId == otherTyped.movieId &&
        rating == otherTyped.rating &&
        review == otherTyped.review;
  }

  @override
  int get hashCode =>
      Object.hashAll([movieId.hashCode, rating.hashCode, review.hashCode]);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['movieId'] = nativeToJson<String>(movieId);
    json['rating'] = nativeToJson<int>(rating);
    json['review'] = nativeToJson<String>(review);
    return json;
  }

  const CreateReviewVariables({
    required this.movieId,
    required this.rating,
    required this.review,
  });
}
