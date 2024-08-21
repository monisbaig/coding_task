# Flutter Firebase Authentication with Cubit
This Flutter project demonstrates a robust implementation of a login screen with Firebase Authentication using Cubit for state management. The application allows users to log in using their email and password, handles loading states, success and error states, integrates Firebase Authentication for secure login, and includes validation for email and password fields.

<img src="https://github.com/user-attachments/assets/0faa0b67-9f18-474b-bb2f-452ba40577bf" width=50% height=50%>

### Stack:
Language - Dart
Framework - Flutter

## Features

### UI Components:
- Email and Password TextFields
- Login Button
- Loading Spinner
- Error Message Display

### State Management:
- Cubit to manage login states (Initial, Loading, Success, Error)

### Firebase Integration:
- Use the Firebase CLI to initialize Firebase in project.
- Firebase Authentication for email and password login
- Automatic user creation if the user doesn't exist

### Navigation:
- Navigate to a placeholder home screen on successful login
- Logout functionality to return to the login screen

### Validation:
- Validate email and password fields for non-empty and correct format
- Display appropriate error messages for validation failures

### A few words:
During development,
I used clean architecture:
- Flutter Bloc.
- Firebase Auth.
- Firebase Core.
- Gap.
- Google Fonts.
- Form Validation Packages.
