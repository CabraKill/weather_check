class UseCaseResponseEntity<T, E> {
  final dynamic data;

  T? get success => data is T ? data : null;

  E? get error => data is E ? data : null;

  const UseCaseResponseEntity.success(
    T this.data,
  );

  const UseCaseResponseEntity.error(E this.data);

  void when({
    required void Function(T) success,
    required void Function(E) error,
  }) {
    if (this.data is T) {
      success(this.data);
    } else if (this.data is E) {
      error(this.data);
    }
  }
}
