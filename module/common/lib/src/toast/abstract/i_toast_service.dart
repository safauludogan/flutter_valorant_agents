/// ToastService is a service that shows a toast message.
abstract class IToastService {
  /// Shows an error message.
  void showErrorMessage({required String message});

  /// Shows a success message.
  void showSuccessMessage({required String message});

  /// Shows an info message.
  void showInfoMessage({required String message});
}
