class Helper {
  String fixTitle(String title) {
    String newTitle = title
        .replaceAll('&#039;', '\'')
        .replaceAll('&quot;', '"')
        .replaceAll('&amp', '&');

    return newTitle;
  }
}
