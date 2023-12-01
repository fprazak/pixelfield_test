part of 'collection_bloc.dart';

@immutable
abstract class CollectionState {}

class CollectionInitialState extends CollectionState {}

class CollectionLoadingState extends CollectionState {}

class CollectionFailedState extends CollectionState {}

class CollectionSuccessState extends CollectionState {
  final List<Bottle> bottle;

  CollectionSuccessState(this.bottle);
}
