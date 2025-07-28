import 'package:bloc/bloc.dart';
import 'package:first_task_elevate/features/home/entities/item_card_entities.dart';
import 'package:first_task_elevate/features/home/presentation/manager/cubit/fetch_item_event.dart';
import 'package:first_task_elevate/features/home/repos/home_repo.dart';

part 'fetch_item_state.dart';

class FetchItemCubit extends Bloc<FetchItemEvent, FetchItemState> {
  FetchItemCubit({required this.homeRepo}) : super(FetchItemState()) {
    on<FetchItemOne>(_fetchItems);
    on<FetchItemTwo>(_fetchItemsTwo);
    on<FetchItemAll>(_getAllData);
  }
  final HomeRepo homeRepo;
  Future<void> _getAllData(FetchItemAll event, Emitter emit) async {
    await Future.wait<void>([
      _fetchItems(FetchItemOne(), emit),
      _fetchItemsTwo(FetchItemTwo(), emit),
    ]);
  }

  Future<void> _fetchItems(FetchItemOne event, Emitter emit) async {
    emit(state.copyWith(
        baseStateFetchItems: BaseStateFetchItems(isLoading: true)));

    var data = await homeRepo.fetchFeatureItems();
    data.fold(
      (l) {
        emit(state.copyWith(baseStateFetchItems: BaseStateFetchItems(data: l)));
      },
      (r) {
        emit(state.copyWith(
            baseStateFetchItems:
                BaseStateFetchItems(errorMessage: r.errorMessage)));
      },
    );
  }

  Future<void> _fetchItemsTwo(FetchItemTwo event, Emitter emit) async {
    await Future.delayed(Duration(seconds: 5));
    emit(state.copyWith(
        baseStateFetchItemsTwo: BaseStateFetchItems(isLoading: true)));

    var data = await homeRepo.fetchFeatureItems();
    data.fold(
      (l) {
        emit(state.copyWith(
            baseStateFetchItemsTwo: BaseStateFetchItems(data: l)));
      },
      (r) {
        emit(state.copyWith(
            baseStateFetchItemsTwo:
                BaseStateFetchItems(errorMessage: r.errorMessage)));
      },
    );
  }
}
