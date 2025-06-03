import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:first_task_elevate/features/home/entities/item_card_entities.dart';
import 'package:first_task_elevate/features/home/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_item_state.dart';

class FetchItemCubit extends Cubit<FetchItemState> {
  FetchItemCubit({required this.homeRepo}) : super(FetchItemInitial());
  final HomeRepo homeRepo;
  fetchItems() async {
    emit(FetchItemLoading());
    log("loading");
    var data = await homeRepo.fetchFeatureItems();
    data.fold(
      (l) {
        emit(FetchItemSuccess(items: l));
        log("success ${l.length}");
      },
      (r) {
        emit(
          FetchItemFailure(errorMessage: r.errorMessage),
        );
        log(r.errorMessage);
        log("Failure");
      },
    );
  }
}
