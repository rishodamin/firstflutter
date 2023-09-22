//login exceptions
class InvalidCredentialsAuthException implements Exception {}

//register exception

class WeakPasswordAuthException implements Exception {}

class EmailAlreadyInUseAuthException implements Exception {}

class InvalidEmailAuthException implements Exception {}

//general exception

class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}
