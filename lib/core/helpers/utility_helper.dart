class Utility {
  static String formatDuration(int minutes) {
    String result = "";
    var hours = minutes ~/ 60;
    if(hours > 0) {
      result += (hours.toString() + "h");
    }
    minutes %= 60;
    if(minutes > 0) {
      result += (minutes.toString() + "m");
    }
    return result;
  }
}