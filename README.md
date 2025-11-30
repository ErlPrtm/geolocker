# GeoLocker Documentation
GeoLocker is a Flutter project designed to track the user's location periodically (still won't work, for now everytime you open the apps it would be tracked) and display the location history, including latitude, longitude, and address. The app supports both Android and iOS platforms, with outputs as APK for Android and IPA for iOS.

## Features
- Periodic location tracking (once a day).
- Displays location history with latitude, longitude, and address.
- Saves location data to a local SQLite database.
- Supports both Android and iOS platforms.
- Getting Started

## Prerequisites
Install Flutter:

Follow the Flutter installation guide.
Install Android Studio and Xcode:
Android Studio for Android development.
Xcode for iOS development.
Setup Instructions
1. Clone the Repository
2. Install Dependencies
Run the following command to install the required Flutter dependencies:

3. Configure Android Permissions
Ensure the following permissions are added to AndroidManifest.xml:

4. Configure iOS Permissions
Add the following keys to Info.plist:

## Building the App
### Android (APK)
Run the following command to build the APK:
The APK file will be generated in the flutter-apk directory.

### iOS (IPA)
Run the following command to build the iOS app:
Open the project in Xcode:
Configure signing and provisioning profiles in Xcode:
Go to the Signing & Capabilities tab.
Select a valid development team.
Export the IPA:
Go to Product > Archive in Xcode.
Select the archive and export the IPA.

## GeoTracker Functionality
- Periodic Location Tracking
The app tracks the user's location once a day using the Timer class.
It fetches the latitude, longitude, and address using the geolocator and geocoding packages.

- Location History
The app saves the location data (date, latitude, longitude, and address) to a local SQLite database.
The location history is displayed in a list format, showing the day, date, latitude, longitude, and address.

- Testing the App

-- Android
Install the APK on a physical Android device or emulator.
Grant location permissions when prompted.
Verify that the location is tracked and displayed in the history.

-- iOS
Install the IPA on a physical iOS device (background tracking cannot be tested on the simulator).
Grant location permissions when prompted.
Verify that the location is tracked and displayed in the history.

- Troubleshooting
Android
If the emulator does not display, restart the ADB server:

iOS
If the app fails to build, ensure signing and provisioning profiles are configured in Xcode.
Let me know if you need further assistance!