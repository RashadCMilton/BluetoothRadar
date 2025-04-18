# Radar Bluetooth Tracker
## Overview
Radar Bluetooth Tracker is an iOS application that visualizes nearby Bluetooth devices in a radar-like interface. The app scans for Bluetooth peripherals and displays them as blips on a radar screen, with their distance from the center determined by signal strength (RSSI).

## Features

- Real-time scanning for nearby Bluetooth devices
- Radar visualization with distance based on signal strength
- Signal smoothing to reduce fluctuations in device positioning
- Clean, dark-themed UI with radar animations
- Device name display for easy identification

## Requirements

- iOS 15.0+
- Xcode 15.0+
- Swift 5.9+
- Device with Bluetooth capabilities

## Installation

1. Clone the repository
   ```bash
   git clone https://github.com/yourusername/RadarBluetoothTracker.git
   ```

2. Open the project in Xcode
   ```bash
   cd RadarBluetoothTracker
   open RadarBluetoothTracker.xcodeproj
   ```

3. Build and run the application on your iOS device

## Permission Requirements

The app requires Bluetooth permissions to function properly. Add the following to your Info.plist:

```xml
<key>NSBluetoothAlwaysUsageDescription</key>
<string>This app needs Bluetooth to scan for nearby devices</string>
<key>NSBluetoothPeripheralUsageDescription</key>
<string>This app needs Bluetooth to scan for nearby devices</string>
```

## Architecture

The app follows the MVVM (Model-View-ViewModel) architecture:

- **Models**:
  - `ScannedDevice`: Represents a discovered Bluetooth peripheral with signal strength tracking

- **ViewModels**:
  - `BluetoothRadarViewModel`: Manages Bluetooth scanning and device discovery

- **Views**:
  - `MainView`: The app's main container view
  - `RadarView`: The radar visualization
  - `BlipView`: Individual device representation on the radar

## How It Works

1. The app initializes the Bluetooth manager and begins scanning for devices
2. When a device is discovered, it's added to the devices list or its signal strength is updated
3. The radar view displays concentric circles with discovered devices positioned based on their signal strength
4. Device positions are smoothed by averaging recent RSSI readings

## Customization

You can customize various aspects of the radar visualization:

- Modify the radar colors in `RadarView.swift`
- Adjust the signal strength mapping in `BlipView.swift`
- Change the number of history readings in `ScannedDevice.swift`

## License

[MIT License](LICENSE)

## Credits

Created by Rashad Milton (2025)
