# Progresso

A linear progress bar for Flutter.

## Getting Started

Add to pubspec.yaml 

```yaml
progresso: <lastest version>
```

import in your flutter project

```dart
import 'package:progresso/progresso.dart';
```

## Features

In its simplest Progress takes a progress parameter

![basic](https://raw.githubusercontent.com/russbiggs/progresso/main/imgs/basic.png)

```dart
Progresso(progress: 0.5);
```

You can also configure the color

![custom color](https://raw.githubusercontent.com/russbiggs/progresso/main/imgs/color.png)


```dart
Progresso(
    progress: 0.5, 
    progressColor: Colors.red, 
    backgroundColor: Colors.blue
);
```

Progresso can even start at a value that is not zero!

![non-zero start](https://raw.githubusercontent.com/russbiggs/progresso/main/imgs/start.png)


```dart 
Progresso(start: 0.3, progress: 0.5);
```

Give the progress bar different stroke caps:

![round end caps](https://raw.githubusercontent.com/russbiggs/progresso/main/imgs/endcap.png)


```dart 
Progresso(
    progress: 0.5, 
    progressStrokeCap: StrokeCap.round,
    backgroundStrokeCap: StrokeCap.round
);
```

Give a List of points to show points along the progress bar

![points](https://raw.githubusercontent.com/russbiggs/progresso/main/imgs/points.png)


```dart
Progresso(progress: 0.5, points: [0.2, 0.4]);
```