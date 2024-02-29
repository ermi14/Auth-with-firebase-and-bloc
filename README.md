# **Flutter Firebase Authentication App**

This Flutter app is a simple demonstration of user authentication features such as login, signup, and password reset using Firebase Authentication service. It follows the principles of Clean Architecture, with three distinct layers: Data Layer, UI, and State Management.

## **Features**

User authentication using Firebase Authentication service.
Login and Signup functionalities.
Password reset feature for forgotten passwords.
Implements the BLoC pattern for state management.
Utilizes get_it for dependency injection.

## **Architecture Overview**

The app is built upon the Clean Architecture principles, separating concerns into three layers:

Data Layer: Responsible for interacting with external data sources such as Firebase Authentication. It abstracts the data retrieval and manipulation operations.

UI Layer: Presents the user interface to the user. It consists of the screens, widgets, and navigational components necessary for the user interaction.

State Management: Utilizes the BLoC (Business Logic Component) pattern for managing application state. This layer handles the business logic, including authentication and user data management.

## **Dependencies**

Firebase Authentication: Provides authentication services for user management.
BLoC: Manages application state using streams and reactive programming.
GetIt: Facilitates dependency injection for decoupling components and improving testability.

## **Setup Instructions**

Clone the repository to your local machine.
Ensure you have Flutter and Dart installed on your development environment.
Set up Firebase project and configure Firebase Authentication.
Replace the Firebase configuration file (google-services.json for Android or GoogleService-Info.plist for iOS) with your own.
Run flutter pub get to install dependencies.
Run the app on an emulator or physical device using flutter run.

## Contributors

**Ermiyas Kasahun**
