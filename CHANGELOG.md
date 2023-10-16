## 0.0.3

### Added
- Added Dart doc documentation
- Added CustomErrorManager

### Changed
- Improved error handling and error instance access.

## Key Features

- **Custom Error Management:** Create and manage custom error objects with error codes and messages.
- **Flexible Error Storage:** Store multiple errors using a list of maps.
- **Error Retrieval:** Easily access individual error details using getter methods.
- **Error State Check:** Check if an error exists with the `hasAnError()` method.
- **Type Checking:** Determine if an object is an instance of `CustomError` using the `isAnError()` method.
- **Show dialogs** with custom titles, messages, and actions when an error occurs.
- **Display SnackBars** with custom backgrounds and behaviors based on error conditions.

## Usage Example

```dart
import 'package:custom_error/custom_error.dart';

void main() {
  String _inputText = 'Mazzi';
  List<String> names = ['Yung', 'Cet', 'Cedric'];

  // Create and manage custom errors
  CustomError error = CustomError();
  if (! names.contains(_inputText)){
    error.setError(-1, 'Name not found.');
  }

  // Check if an error exists
  // you can also use error.isAnError(), instead of error.hasAnError()
  // To display a dialog / snackbar when an error has occured use CustomErrorManager, see examples below
  if (error.hasAnError()) {
    // handle error
    print('Error: ${error.getError()}, Code: ${error.getErrorCode()}');
  } else {
    print('No error found.');
  }

  // Add multiple errors
  error.addError(200, 'Error 200');
  error.addError(300, 'Error 300');

  // Retrieve all errors
  final allErrors = error.getAllErrors();

  // Check if an error exists
  if (error.isAnError()) {
    print('All Errors: $allErrors');
  } else {
    print('No error found.');
  }
}
```

### Showing a Dialog / SnackBar when an error occurs using CustomErrorManager

#### Error Dialog

```dart
import 'package:custom_error/custom_error.dart';

...
...
  ElevatedButton(
    onPressed: (){
      CustomError customError = CustomError();
      customError.setError(-1, 'Showing Error Dialog');

      // add dialog buttons
      final actions = <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            // add code logic for the button
          },
          child: Text('OK'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            // add code logic for the button
          },
          child: Text('Cancel'),
        )
      ];

      // Show a dialog when an error occurs
      CustomErrorManager.showDialogIfError(
        context,
        customError,
        "Error Title",
        "Optional error message", // if set to null, customError.getError() message will be used
        actions,
      );
    },
    child: Text('Show Error Dialog'),
  ),
  ...
  ...
```

#### Error SnackBar

```dart
import 'package:custom_error/custom_error.dart';

...
...
  ElevatedButton(
    onPressed: (){
      CustomError customError = CustomError();
      customError.setError(-1, 'Showing Error SnackBar');

      // Display a SnackBar when an error occurs
      CustomErrorManager.showSnackBarIfError(
        context,
        customError,
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      );
    },
    child: Text('Show Error SnackBar'),
  )
  ...
  ...
```

## 0.0.3

### Added
- The `CustomError` constructor no longer needs parameters.
- A new function `hasAnError()` to check if an error exists.

### Changed
- Improved error handling and error instance access.

## Key Features

- **Custom Error Management:** Create and manage custom error objects with error codes and messages.
- **Flexible Error Storage:** Store multiple errors using a list of maps.
- **Error Retrieval:** Easily access individual error details using getter methods.
- **Error State Check:** Check if an error exists with the `hasAnError()` method.
- **Type Checking:** Determine if an object is an instance of `CustomError` using the `isAnError()` method.

## Usage Example

```dart
import 'package:custom_error/custom_error.dart';

void main() {
  String _inputText = 'Mazzi';
  List<String> names = ['Yung', 'Cet', 'Cedric'];

  // Create and manage custom errors
  CustomError error = CustomError();
  if (! names.contains(_inputText)){
    error.setError(-1, 'Name not found.');
  }

  // Check if an error exists
  // you can also use error.isAnError(), instead of error.hasAnError()
  if (error.hasAnError()) {
    // handle error
    print('Error: ${error.getError()}, Code: ${error.getErrorCode()}');
  } else {
    print('No error found.');
  }

  // Add multiple errors
  error.addError(200, 'Error 200');
  error.addError(300, 'Error 300');

  // Retrieve all errors
  final allErrors = error.getAllErrors();

  // Check if an error exists
  if (error.isAnError()) {
    print('All Errors: $allErrors');
  } else {
    print('No error found.');
  }
}
```

## 0.0.2

### Added
- Changed Error class to `CustomError`.

### Changed
- Improved error handling and error instance access.

## Key Features

- **Custom Error Management:** Create and manage custom error objects with error codes and messages.
- **Flexible Error Storage:** Store multiple errors using a list of maps.
- **Error Retrieval:** Easily access individual error details using getter methods.
- **Comprehensive Error Access:** Retrieve all errors for debugging and reporting.
- **Type Checking:** Verify if a value is an instance of the `Error` class.

## Usage Example

```dart
import 'package:custom_error/custom_error.dart';

void main() {
  // Create and manage custom errors
  final error = CustomError(100, 'Error 100');
  // Check if a value is an Error instance
  bool isCustomError = error.isAnError(error);

  // Access error details
  String errorMessage = error.getError();
  int errorCode = error.getErrorCode();

  // add multiple errors
  error.addError(200, 'Error 200');

  // Retrieve all errors
  List<Map<String, dynamic>> allErrors = error.getAllErrors();

}
```

## 0.0.1

# Initial Release Changelog

We are excited to announce the initial release of the "custom_error" package. This release marks the beginning of a new era in error management for Dart developers. "custom_error" empowers you to create, store, and access custom error instances with ease, making error handling more efficient and effective in your Dart applications.

## Key Features

- **Custom Error Management:** Create and manage custom error objects with error codes and messages.
- **Flexible Error Storage:** Store multiple errors using a list of maps.
- **Error Retrieval:** Easily access individual error details using getter methods.
- **Comprehensive Error Access:** Retrieve all errors for debugging and reporting.
- **Type Checking:** Verify if a value is an instance of the `Error` class.

## Usage Example

```dart
import 'package:custom_error/custom_error.dart';
void main() {
  // Create and manage custom errors
  final error = Error(100, 'Error 100');
  error.AddError(200, 'Error 200');
  // Access error details
  String errorMessage = error.getError();
  int errorCode = error.getErrorCode();
  // Retrieve all errors
  List<Map<String, dynamic>> allErrors = error.getAllErrors();
  // Check if a value is an Error instance
  bool isCustomError = error.isAnError(error);
}
```