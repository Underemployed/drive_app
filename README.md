# File Management Flutter App

This Flutter application provides a simple file management solution for users to upload, view, and organize different types of files, including PDFs, images, and videos, using Firebase for storage and authentication.

## Features

- **File Upload:** Users can select and upload files with various extensions (PDF, Image, Video) using the File Picker package.

- **Firebase Integration:** Firebase Authentication and Firestore are used for user authentication and data storage.

- **File Viewing:** Users can view uploaded files by tapping on them in the list. Depending on the file type, the app navigates to different screens (image view, PDF view, video player) for displaying the content.

- **Folder Management:** Users can create folders for organizing their files, and there is an option to delete folders along with their contents.

## Installation

1. Clone the repository to your local machine:

   ```
   git clone https://github.com/Underemployed/flutter_firebase_storage.git
   ```



2. Install the required Flutter packages:

   ```
   flutter pub get
   ```

4. Configure Firebase:
   
   - Set up a Firebase project on the [Firebase Console](https://console.firebase.google.com/).
   - Download the `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) configuration files and place them in the respective platform-specific directories.

## Usage

1. Launch the app using `flutter run`.

2. Sign in or create an account to start using the file management features.

3. Upload files by tapping the "+" button, and select a file from your device.

4. View and manage your files within folders.

## Contributing

Contributions to this project are welcome! If you encounter any issues or have ideas for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](https://github.com/Underemployed/flutter_firebase_storage/blob/main/LICENSE).



---
