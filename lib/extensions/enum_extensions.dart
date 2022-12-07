

extension EnumParser on String {
  T toEnum<T>(List<T> values) {
    return values.firstWhere(
        (e) => e.toString().toLowerCase().split(".").last == toLowerCase(),
        orElse: () => values.first); //return null if not found
  }
}


// https://medium.com/dartlang/dart-2-15-7e7a598e508a
// Enum to String
// YourEnum.item.toString() >> 'YourEnum.item'
// YourEnum.item.name >> 'item'

// look up / compare
// YourEnum.values.byName('item') == YourEnum.item

// String to Enum
