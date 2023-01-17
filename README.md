# flutter_pausable_countdown_timer

It is a simple pausable countdown timer.

## Preview

<img src="https://user-images.githubusercontent.com/41714308/212894108-33bca755-0c40-4ff8-a07d-647a6d096c0e.gif" width="250">

## Getting Started

Run this command:

```zsh
flutter pub add circular_countdown_timer
```

## Features

- Automatic start timer.
- Customize textstyle.
- There are three actions: pause, restart, and finish.

## Usage

```dart
CountdownTimer(
  seconds: 1000,
  textStyle: const TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
  pauseAction: () {
    debugPrint('pause action');
  },
  restartAction: () {
    debugPrint('restart action');
  },
  finishAction: () {
    debugPrint('finish action');
  },
);
```

## Parameters

|Name|Type|Default Value|Description
|:-------------|:----------|:--------|:------------|
|`seconds`|`int`|required|*Seconds to count down.*|
|`textStyle`|`TextStyle?`|null|*Customize textstyle.*|
|`pauseAction`|`void Function()?`|null|*pause action.*|
|`restartAction`|`void Function()?`|null|*restart action.*|
|`finishAction`|`void Function()?`|null|*finish action.*|

## Contributing

Contributions are welcomed!

Here is a curated list of how you can help:

- Report bugs and scenarios that are difficult to implement
- Report parts of the documentation that are unclear
- Fix typos/grammar mistakes
- Update the documentation / add examples
- Implement new features by making a pull-request
