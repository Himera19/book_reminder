# Book Reminder
**A Book Favorites and Reminder Application Made With Flutter**

## GIF Demo
<img src="https://github.com/Himera19/book_reminder/blob/master/app_preview.gif" height="450">
 
## Features
- **Book Favoriting**: Users can add their desired books to their favorites.
- **Book Filtering**: Users can search and find books easily.
- **Daily Reminders**: Users can set daily reminders for their books.
- **Local Storage**: Books fetched from the API are stored locally with Hive, allowing access without the need for an internet connection.
- **Favorite Books**: Books added to favorites are accessible offline and stored completely locally.
- **Theme Options**: The app offers two themes: dark and light.
- **Language Support**: The app supports both English and Turkish languages.
- **Responsive UI**: The app supports different screen sizes for mobile phones.
- **Unit Testing**: The app includes tests for the API query system to ensure reliability.
- **Very Good analysis**: So provides lint rules for Dart and Flutter which are used at Very Good Ventures.

## Key Dependencies
- **Hive**: Stores book data and user preferences locally.
- **Provider**: Maintains app integrity and manages state.
- **Flutter Local Notification**: Provides notifications for reminders.
- **Flutter Localizations**: Supports both English and Turkish languages.
- **Screen Util**: Supports different screen sizes for mobile phones.
- **HTTP**: Sends API requests and processes the returned results.
- **Mockito**: Used for testing API queries.
- **Very Good analysis**: So provides lint rules for Dart and Flutter which are used at Very Good Ventures.
- **Note**: All comments in the code are written in Turkish.

## Requirements
- **Dart 3.5.3 or above.****
- **Flutter 3.24.3 or above.****

## Setup
1. Run ```flutter gen-l10n``` for initialize localizations.
2. Run ```flutter run``` for run app.

## License
This project is licensed under the MIT License.
