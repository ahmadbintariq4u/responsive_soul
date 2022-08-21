part of flutter_soul;

class StackSoul<E> {
  StackSoul() : _storage = <E>[];

  StackSoul.of(Iterable<E> elements) : _storage = List<E>.of(elements);

  final List<E> _storage;

  void push(E element) => _storage.add(element);

  E pop() => _storage.removeLast();

  E get peek => _storage.last;

  bool get isEmpty => _storage.isEmpty;

  bool get isNotEmpty => !isEmpty;

  @override
  String toString() {
    return '--- Top ---\n'
        '${_storage.reversed.join('\n')}'
        '\n-----------';
  }
}
