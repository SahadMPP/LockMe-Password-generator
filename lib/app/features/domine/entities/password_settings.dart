class PasswordSettings {
  final int passwordLength;
  final bool withLowerCase;
  final bool withUpperCase;
  final bool withSymbol;
  final bool withNumber;
  final bool excludeDuplicate;
  final bool includeSpaces;

  PasswordSettings(
      {required this.passwordLength,
      required this.withLowerCase,
      required this.withUpperCase,
      required this.withSymbol,
      required this.withNumber,
      required this.excludeDuplicate,
      required this.includeSpaces});
}
