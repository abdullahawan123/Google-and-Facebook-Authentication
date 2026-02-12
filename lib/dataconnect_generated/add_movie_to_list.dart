part of 'generated.dart';

class AddMovieToListVariablesBuilder {
  String listId;
  String movieId;
  int position;

  final FirebaseDataConnect _dataConnect;
  AddMovieToListVariablesBuilder(
    this._dataConnect, {
    required this.listId,
    required this.movieId,
    required this.position,
  });
  Deserializer<AddMovieToListData> dataDeserializer = (dynamic json) =>
      AddMovieToListData.fromJson(jsonDecode(json));
  Serializer<AddMovieToListVariables> varsSerializer =
      (AddMovieToListVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<AddMovieToListData, AddMovieToListVariables>>
  execute() {
    return ref().execute();
  }

  MutationRef<AddMovieToListData, AddMovieToListVariables> ref() {
    AddMovieToListVariables vars = AddMovieToListVariables(
      listId: listId,
      movieId: movieId,
      position: position,
    );
    return _dataConnect.mutation(
      "AddMovieToList",
      dataDeserializer,
      varsSerializer,
      vars,
    );
  }
}

@immutable
class AddMovieToListListMovieInsert {
  final String id;
  AddMovieToListListMovieInsert.fromJson(dynamic json)
    : id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }

    final AddMovieToListListMovieInsert otherTyped =
        other as AddMovieToListListMovieInsert;
    return id == otherTyped.id;
  }

  @override
  int get hashCode => id.hashCode;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  const AddMovieToListListMovieInsert({required this.id});
}

@immutable
class AddMovieToListData {
  final AddMovieToListListMovieInsert listMovie_insert;
  AddMovieToListData.fromJson(dynamic json)
    : listMovie_insert = AddMovieToListListMovieInsert.fromJson(
        json['listMovie_insert'],
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }

    final AddMovieToListData otherTyped = other as AddMovieToListData;
    return listMovie_insert == otherTyped.listMovie_insert;
  }

  @override
  int get hashCode => listMovie_insert.hashCode;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['listMovie_insert'] = listMovie_insert.toJson();
    return json;
  }

  const AddMovieToListData({required this.listMovie_insert});
}

@immutable
class AddMovieToListVariables {
  final String listId;
  final String movieId;
  final int position;
  @Deprecated(
    'fromJson is deprecated for Variable classes as they are no longer required for deserialization.',
  )
  AddMovieToListVariables.fromJson(Map<String, dynamic> json)
    : listId = nativeFromJson<String>(json['listId']),
      movieId = nativeFromJson<String>(json['movieId']),
      position = nativeFromJson<int>(json['position']);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }

    final AddMovieToListVariables otherTyped = other as AddMovieToListVariables;
    return listId == otherTyped.listId &&
        movieId == otherTyped.movieId &&
        position == otherTyped.position;
  }

  @override
  int get hashCode =>
      Object.hashAll([listId.hashCode, movieId.hashCode, position.hashCode]);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['listId'] = nativeToJson<String>(listId);
    json['movieId'] = nativeToJson<String>(movieId);
    json['position'] = nativeToJson<int>(position);
    return json;
  }

  const AddMovieToListVariables({
    required this.listId,
    required this.movieId,
    required this.position,
  });
}
