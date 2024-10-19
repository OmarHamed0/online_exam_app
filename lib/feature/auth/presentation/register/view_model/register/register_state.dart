part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
class RegisterLoadingStata extends RegisterState{}
class RegisterSuccessStata extends RegisterState{
  final User ? user;
  RegisterSuccessStata({required this.user});
}
class RegisterErrorStata extends RegisterState{
  final String errorMassage;
  RegisterErrorStata({required this.errorMassage});

}
class UpdateValidationState extends RegisterState {}
