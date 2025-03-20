part of 'search_textfield.dart';

mixin _SearchOperationMixin on State<SearchTextfield> {
  /// Debounce timer
  Timer? _debounce;

  /// Is focused
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
  }

  Future<void> _onChangedOperation(String? text) async {
    if (text == null) return;

    /// Cancel the previous timer
    _debounce?.cancel();

    /// Set a new timer
    _debounce = Timer(const ProjectDurations.xsDuration(), () {
      try {
        widget.onChanged?.call(text);
      } catch (e) {
        return;
      } finally {
        _debounce?.cancel();
      }
    });
  }
}
