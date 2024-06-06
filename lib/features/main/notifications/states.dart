part of 'bloc.dart';
class NotificationsStates {}
class NotificationsLoadingState extends NotificationsStates {}
class NotificationsSuccessState extends NotificationsStates {
  final List <Notifications> list;

  NotificationsSuccessState({required this.list});
}
class NotificationsFailedState extends NotificationsStates {
  final String msg;
  NotificationsFailedState({required this.msg});

}