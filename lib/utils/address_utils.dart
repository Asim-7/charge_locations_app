/// Utility function to split an address string at the first comma.
/// Returns a [List<String>] with [title, subtitle].
/// If no comma is present, returns [address, address].
List<String> splitAddress(String address) {
  if (address.contains(',')) {
    final idx = address.indexOf(',');
    return [
      address.substring(0, idx).trim(),
      address.substring(idx + 1).trim(),
    ];
  } else {
    return [address, address];
  }
}
