part of flutter_soul;

/// The DoublyLinkedList Node.
///
/// It has both previous and next references.
class DoubleLinkedListNode<T> {
  /// The data [this] contains
  T data;

  /// Reference to previous [DoubleLinkedListNode]
  DoubleLinkedListNode<T>? previous;

  /// Reference to next [DoubleLinkedListNode]
  DoubleLinkedListNode<T>? next;

  /// Initialize [DoubleLinkedListNode] with data.
  DoubleLinkedListNode(this.data);
}

/// DoubleLinkedList ADT
class DoublyLinkedListSoul<T> {
  /// First node of the list
  DoubleLinkedListNode<T>? head;

  /// Last node of the list
  DoubleLinkedListNode<T>? tail;

  /// Size of the list
  int length;

  /// Constructor
  DoublyLinkedListSoul() : length = 0;

  /// Creates DoublyLinkedList from [list]
  DoublyLinkedListSoul.fromList(List<T> list) : length = 0 {
    for (var item in list) {
      append(item);
    }
  }

  /// Checks if [this] is empty
  bool get isEmpty => length == 0;

  /// Converts [this] into a [List]
  List<T> get toList {
    var asList = <T>[];

    var current = head;
    while (current != null) {
      asList.add(current.data);
      current = current.next;
    }

    return asList;
  }

  /// Show the [n]th element of the list.
  ///
  /// The list remains unmodified. `null` when index is out of bounds
  DoubleLinkedListNode<T> at(int n) {
    if (n >= length || n < 0) throw InvalidIndexError();

    var current = head;
    for (var index = 0; index != n; index++) {
      current = current!.next;
    }

    return current!;
  }

  /// Add something to the beginning of [this]
  void prepend(T data) {
    var newNode = DoubleLinkedListNode(data);

    if (isEmpty) {
      _setOnlyNode(newNode);
    } else {
      newNode.next = head;
      head!.previous = newNode;
      head = newNode;
    }

    length++;
  }

  /// Add something at the end of [this]
  void append(T data) {
    var newNode = DoubleLinkedListNode(data);

    if (isEmpty) {
      _setOnlyNode(newNode);
    } else {
      newNode.previous = tail;
      tail!.next = newNode;
      tail = newNode;
    }

    length++;
  }

  /// Insert [data] at [n] index
  void insert(T data, int n) {
    var newNode = DoubleLinkedListNode(data);

    var nextNode = at(n);

    if (nextNode == head) {
      prepend(newNode.data);
    } else {
      newNode.next = nextNode;
      newNode.previous = nextNode.previous;

      newNode.previous!.next = newNode;
      nextNode.previous = newNode;
      length++;
    }
  }

  /// Remove the last element
  DoubleLinkedListNode<T> pop() {
    if (isEmpty) throw InvalidIndexError();

    var removeMe = tail!;
    if (length == 1) {
      _makeEmpty();
    } else {
      tail = removeMe.previous;
      tail!.next = null;
      removeMe.previous = null;
    }

    length--;
    return removeMe;
  }

  /// Remove the first element
  DoubleLinkedListNode<T> shift() {
    if (isEmpty) throw InvalidIndexError();

    var removeMe = head!;
    if (length == 1) {
      _makeEmpty();
    } else {
      head = removeMe.next;
      head!.previous = null;
      removeMe.next = null;
    }

    length--;
    return removeMe;
  }

  /// Remove from [n] index
  DoubleLinkedListNode<T> remove(int n) {
    var removeMe = at(n);

    if (removeMe == head) {
      return shift();
    } else if (removeMe == tail) {
      return pop();
    } else {
      removeMe.previous?.next = removeMe.next;
      removeMe.next?.previous = removeMe.previous;
      length--;
    }

    return removeMe;
  }

  /// Set this list to empty
  void _makeEmpty() {
    head = null;
    tail = null;
  }

  /// Set [node] as the only node for [this]
  void _setOnlyNode(DoubleLinkedListNode<T> node) {
    head = node;
    tail = node;
  }
}
