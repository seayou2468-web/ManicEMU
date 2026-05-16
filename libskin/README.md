# LibSkin

LibSkin is a general-purpose library for handling .manicskin (and compatible) skins, extracted from ManicEmu.

## Features
- Full support for .manicskin, .deltaskin, and .gammaskin formats.
- Controller skin parsing and rendering.
- "Flex" skin support for dynamic layout adjustments.
- Independent of ManicEmu specific logic.

## Usage
Configure `LibSkin` with a data source and settings provider.

```swift
LibSkin.dataSource = MyDataSource()
LibSkinSettings.shared = MySettings()
```

Show skin settings:
```swift
let vc = SkinSettingsViewController(gameType: .gba)
present(vc, animated: true)
```
