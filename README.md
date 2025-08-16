# Circles Animation App

A Garmin Connect IQ app that creates animated circles at tap locations with growing radius and color cycling.

## Features

- **Tap to Create**: Tap anywhere on the screen to create a new circle
- **Growing Animation**: Circles start small (5px radius) and grow to a maximum size (50px radius) over 3 seconds
- **Color Cycling**: Each new circle uses a different color from a predefined palette
- **Auto Cleanup**: Circles are automatically removed when they reach their maximum size
- **Smooth Animation**: 50ms timer updates for smooth visual effects

## How It Works

1. **Circle Class**: Each circle stores its position, current radius, color, and timing information
2. **Animation Timer**: A 50ms timer updates all active circles, growing their radius and fading their opacity
3. **Color Palette**: Uses 7 different colors that cycle through as new circles are created
4. **Memory Management**: Expired circles are automatically removed from the array to prevent memory leaks

## Colors Used

- Light Gray
- Blue
- Green
- Yellow
- Purple
- Orange
- Dark Blue

## Build Instructions

This project requires the Garmin Connect IQ SDK and VS Code with the Monkey C extension.

1. Install the Garmin Connect IQ SDK
2. Install the Monkey C extension for VS Code
3. Open the project in VS Code
4. Use the Monkey C commands to build and deploy to your device

## Target Devices

The app is configured to work with various Garmin Forerunner devices including:
- FR165, FR245, FR255, FR265, FR55, FR745, FR945, FR955, FR965, FR970
- And their music variants (FR165m, FR245m, FR255m, FR265s, etc.)

## Usage

Simply tap anywhere on the watch screen to create animated circles. Each tap creates a new circle that grows and fades over 3 seconds before disappearing.
