import 'package:audit_info/Repositry/Api/accountant/accountantApi.dart';
import 'package:audit_info/Repositry/model/accountant_modal.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'accountant_event.dart';
part 'accountant_state.dart';

class AccountantBloc extends Bloc<AccountantEvent, AccountantState> {
  List<AccountantModel> account = [];

  AccountantBloc() : super(AccountantblocInitial()) {
    on<fetchAccountant>((event, emit) async {
      emit(Accountantblocloading());
      try {
        final List<AccountantModel> result =
            await Accountantapi().getAccountant();
        print("Fetched ${result.length} accountants");
        emit(Accountantblocloaded(Account: result));
      } catch (e) {
        print("Fetch Accountant error: $e");
        emit(AccountantblocError());
      }
    });

    on<AddAccount>((event, emit) async {
      emit(Accountantblocloading());
      try {
        await Accountantapi().AddAccount(event.Accountdata);

        final result = await Accountantapi().getAccountant();

        emit(Accountantblocloaded(Account: result));
      } catch (e) {
        print("API add error: $e");
        emit(AccountantblocError());
      }
    });

    on<deleteaccount>((event, emit) async {
      emit(Accountantblocloading());
      try {
        await Accountantapi().deleteaccount(event.id);
        final updateddelete = await Accountantapi().getAccountant();
        print("Fetched ${updateddelete.length} agents after deletion");
        emit(Accountantblocloaded(Account: updateddelete));
      } catch (e) {
        print("API delete error: $e");
        emit(AccountantblocError());
      }
    });

    on<UpdateAccount>((event, emit) async {
      emit(Accountantblocloading());
      try {
        await Accountantapi().updateAccount(event.updatedData, event.id);

        final result = await Accountantapi().getAccountant();

        emit(Accountantblocloaded(Account: result));
      } catch (e) {
        print("API update error: $e");
        emit(AccountantblocError());
      }
    });
  }
}
