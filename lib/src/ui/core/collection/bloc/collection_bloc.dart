import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';
import 'package:pixelfield_test/src/lib/model/bottle.dart';

part 'collection_event.dart';
part 'collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  CollectionBloc() : super(CollectionInitialState()) {
    on<LoadBottlesEvent>(_onLoadBottlesEvent);
  }

  Future<void> _onLoadBottlesEvent(
      LoadBottlesEvent event, Emitter<CollectionState> emit) async {
    emit(CollectionLoadingState());
    try {
      //if is internet => await load data from somewhere
      bool internetAvailable = await InternetConnectionChecker().hasConnection;
      //if(!internetAvailable) return SomeStoredData from cache or from stored local;
      emit(CollectionSuccessState(mockedBottles));
    } catch (e) {
      emit(CollectionFailedState());
    }
  }
}

///mocked data
List<Bottle> mockedBottles = [
  const Bottle(
    name: "Springbank",
    distillery: "distillery",
    region: "region",
    country: "country",
    type: "type",
    ageStatement: "1992",
    filled: "112/158",
    bottled: "bottled",
    caskNumber: "#195453",
    abv: 52,
    size: 1.5,
    finish: "finish",
    videoUrl: "videoUrl",
    nose: "nose",
    palate: "palate",
  ),
  const Bottle(
    name: "Springbank",
    distillery: "distillery",
    region: "region",
    country: "country",
    type: "type",
    ageStatement: "1992",
    filled: "112/158",
    bottled: "bottled",
    caskNumber: "#195453",
    abv: 52,
    size: 1.5,
    finish: "finish",
    videoUrl: "videoUrl",
    nose: "nose",
    palate: "palate",
  ),
  const Bottle(
    name: "Springbank",
    distillery: "distillery",
    region: "region",
    country: "country",
    type: "type",
    ageStatement: "1992",
    filled: "112/158",
    bottled: "bottled",
    caskNumber: "#195453",
    abv: 52,
    size: 1.5,
    finish: "finish",
    videoUrl: "videoUrl",
    nose: "nose",
    palate: "palate",
  ),
  const Bottle(
    name: "Springbank",
    distillery: "distillery",
    region: "region",
    country: "country",
    type: "type",
    ageStatement: "1992",
    filled: "112/158",
    bottled: "bottled",
    caskNumber: "#195453",
    abv: 52,
    size: 1.5,
    finish: "finish",
    videoUrl: "videoUrl",
    nose: "nose",
    palate: "palate",
  ),
];
