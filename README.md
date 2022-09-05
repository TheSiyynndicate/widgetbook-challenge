
Widgetbook Challenge Challenge!



## Prologue

*The first thing I would usually do in any project is setup the linter first but I found the one that came with the project sufficient.
<br/>
*Next I would set up the splash screen but I assume it wasn't necessary here.<br/>
*Bloc is my preferred state management solution and architecture. Plus testing BLocC is really convenient<br/>
*I have written unit,widget,integration test for the project

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/TheSiyynndicate/widgetbook-challenge.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get 
```

## WidgetBook Challenge Features:

* Localization
* Accessibility
* Routing
* Theme
* Testing
* Validation


### Up-Coming Features:


* 100% code coverage

### Libraries & Tools Used

* [flutter_bloc](https://pub.dev/packages/flutter_bloc)
* [dartz](https://pub.dev/packages/dartz)
* [equatable](https://pub.dev/packages/equatable)
* [flutter_localizations](https://pub.dev/packages/flutter_localizations)
* [formz](https://pub.dev/packages/formz)


#### Dev dependencies
* [bloc_test](https://pub.dev/packages/bloc_test)
* [test](https://pub.dev/packages/test)
* [very_good_analysis](https://pub.dev/packages/very_good_analysis)

### Folder Structure

```
lib/
|- api
|- bloc
|- constants
|- localization
|- themes
|- ui
|- utils
```

### Main

This is the starting point of the application. All the application level configurations are defined
in this file i.e, theme, routes, title, orientation etc.

```dart

/// ignore_for_file: public_member_api_docs



import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgetbook_challenge/api/repositories/name_validation_repository.dart';
import 'package:widgetbook_challenge/app.dart';

void main() {
  final nameValidationRepository = NameValidationRepository();
  runApp(App(
    nameValidationRepository: nameValidationRepository,
  ),);
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      print('${bloc.runtimeType} $event');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      print('${bloc.runtimeType} $change');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print('${bloc.runtimeType} $transition');
    }
  }
}


```

## Conclusion

I will be happy to answer any questions that you may have on this approach, suggestions and or improvements.

Again to note, this is example can appear as over-architecture for what it is - but I mostly try to obey SOLID principles.

Find me at www.github.com/theSiyynndicate
