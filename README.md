

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

## Known Issue: Video Upload with File Picker

- **Issue Description:** You may encounter an issue when trying to upload videos using the File Picker package. The app may not recognize video files with the "mp4" extension as expected.

PlatformException (PlatformException(FilePicker, Unsupported filter. Make sure that you are only using the extension without the dot, (ie., jpg instead of .jpg). This could also have happened because you are using an unsupported file extension.  If the problem persists, you may want to consider using FileType.all instead., null, null))


- **Resolution Attempts:** I attempted to address this issue by specifying the allowed file extensions for video uploads using Filetypes.all in the `FilePicker` configuration. However, this solution did not resolve the problem.

- **Help Needed:** If you have experience with the File Picker package or have encountered a similar issue and found a solution, please consider contributing to this project by submitting a fix or sharing your insights.

## Contributing

Contributions to this project are welcome! If you encounter any issues or have ideas for improvements, please open an issue or submit a pull request.



---
