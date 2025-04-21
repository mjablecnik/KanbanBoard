# kanban_board_design
Design package for example project.

## Develop and test with Flutter version
3.29.0

## Setup FVM, Task and Flutter
  ```
  1) Run: dart pub global activate fvm
  2) Run: fvm install <flutter version>
  3) Run: fvm use <flutter version>
  4) Install Task Manager by this manual: https://taskfile.dev/installation/
  ```

## Usage
1) Add kanban_board_design into your project dependencies:
  ```yaml
  dependencies:
    kanban_board_design:
      git: git@github.com:mjablecnik/kanban_board_design.git
  ```
   
2) Into your root MaterialApp add our theme:
  ```dart
  MaterialApp(
    theme: DesignPackageTheme.light,
    darkTheme: DesignPackageTheme.dark
  )
  ```

or you can use only extensions:
  ```dart
  MaterialApp(
    theme: ThemeData(
      brightness: Brightness.dark,
      extensions:  [ DesignPackageThemeExtension.dark ],
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
      extensions:  [ DesignPackageThemeExtension.dark ],
    )
  )
  ```

3) Use our components in your project:
  ```dart
  class ExampleWidget extends StatelessWidget {
     const ExampleWidget({super.key});
  
     @override
     Widget build(BuildContext context) {
        return Column(
           children: [
              SimpleButton(
                 text: context.t.login.submit,
                 onTap: () => debugPrint("Test click"),
                 // You can customize default styles via copyWith:
                 style: context.designTheme.buttonsStyle.simpleButtonStyle.copyWith(
                    defaultColor: AppColors.orange,
                 ),
              ),
              SimpleButton(
                 text: context.t.login.submit,
                 onTap: () => debugPrint("Test click"),
              ),
           ],
        );
     }
  }
  ```

## Development setup

  ```
  1) Clone this repository
  2) Setup fvm and Flutter
  3) Run: fvm flutter pub get
  4) Run: fvm dart run build_runner watch --delete-conflicting-outputs
  5) Run: fvm flutter run lib/storybook.dart"
  ```

## Golden tests

- For start tests run: `fvm flutter test`
- For generate tests run: `fvm flutter test --update-goldens`

## Special thanks

- [Dart](https://dart.dev/): Client-optimized language for fast apps on any platform.
- [Flutter](https://flutter.dev/): UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.
- [theme_tailor](https://pub.dev/packages/theme_tailor): Theme builder for Flutter.
- [storybook_toolkit](https://pub.dev/packages/storybook_toolkit): Toolkit for preview and development widgets in Flutter.


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.


## Author

👤 **Martin Jablečník**

* Website: [martin-jablecnik.cz](https://www.martin-jablecnik.cz)
* Github: [@mjablecnik](https://github.com/mjablecnik)
* Blog: [dev.to/mjablecnik](https://dev.to/mjablecnik)


## Show your support

Give a ⭐️ if this project helped you!

<a href="https://www.patreon.com/mjablecnik">
  <img src="https://c5.patreon.com/external/logo/become_a_patron_button@2x.png" width="160">
</a>


## 📝 License

Copyright © 2024 [Martin Jablečník](https://github.com/mjablecnik).<br />
This project is [MIT License](https://choosealicense.com/licenses/mit/) licensed.

