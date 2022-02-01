abstract class AccountStates {}

class InitialAccountState extends AccountStates{}


class EditSuccessState extends AccountStates{}
class EditErrorState extends AccountStates{}
class EditLoadingState extends AccountStates{}