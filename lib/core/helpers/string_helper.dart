class StringHelper {
  static String extractInitials(String fullName) {
    final nameParts = fullName.split(' ');

    final firstLetterFirstName = nameParts[0].substring(0, 1);
    String lastLetterLastName;

    if (nameParts.length > 1 && nameParts.last.isNotEmpty) {
      lastLetterLastName = nameParts.last.substring(0, 1);
    } else {
      lastLetterLastName = nameParts[0].substring(nameParts[0].length - 1);
    }

    return firstLetterFirstName.toUpperCase() +
        lastLetterLastName.toUpperCase();
  }
}
