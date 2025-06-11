import 'package:audit_info/Repositry/Api/branch%20Api/BranchManager_Api.dart';
import 'package:audit_info/Repositry/model/BranchManager.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'branch_manager_event.dart';
part 'branch_manager_state.dart';

class BranchManagerBloc extends Bloc<BranchManagerEvent, BranchManagerState> {
  final BranchmanagerApi branchmanagerApi = BranchmanagerApi();
  late Branchmodel branch;

  BranchManagerBloc() : super(BranchManagerBlocInitial()) {
    on<BranchManagerEvent>((event, emit) async {
      emit(BranchManagerBlocloading());
      try {
        branch = await branchmanagerApi.getBranchManager();
        emit(BranchManagerBlocloaded(branches: branch));
      } catch (e) {
        print("Branchmanagererror:$e");
        emit(BranchManagerBlocError());
      }
    });
  }
}
