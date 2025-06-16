

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
        final result = await Accountantapi().getAccountant();
        account = [result];
        emit(Accountantblocloaded(Account: account));
      } catch (e) {
        print("API fetch error: $e");
        emit(AccountantblocError());
      }
    });

    
    on<AddAccount>((event, emit) async {
      emit(Accountantblocloading());
      try {
        await Accountantapi().AddAccount(event.Accountdata);

        final result = await Accountantapi().getAccountant();
        account = [result];
        emit(Accountantblocloaded(Account: account));
      } catch (e) {
        print("API add error: $e");
        emit(AccountantblocError());
      }
    });

   
    on<deleteaccount>((event, emit) async {
      emit(Accountantblocloading());
      try {
        await Accountantapi().deleteaccount(event.id);
        account.removeWhere((a) => a.id == event.id);
        emit(Accountantblocloaded(Account: account));
      } catch (e) {
        print("API delete error: $e");
        emit(AccountantblocError());
      }
    });

    
    // on<UpdateAccountStatus>((event, emit) async {
    //   emit(Accountantblocloading());
    //   try {
    //     final updatedAccount = await Accountantapi().updateAccount(event.updatedData);
    //     final index = account.indexWhere((a) => a.id == updatedAccount['id']);
    //     if (index != -1) {
    //       account[index] = AccountantModel.fromJson(updatedAccount);
    //     }
    //     emit(Accountantblocloaded(Account: account));
    //   } catch (e) {
    //     print("API update error: $e");
    //     emit(AccountantblocError(error: e.toString()));
    //   }
    // });
  }
}

