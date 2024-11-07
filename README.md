# spiral

A new Flutter project designed for managing appointments, user authentication, and various financial services.

## Getting Started

**Features**
**User Authentication:**
Login using email/password or biometric methods (fingerprint).
Secure storage of user credentials.

**Appointment Management:**
View and manage appointments with doctors, including details such as time and date.

**Financial Services:**
Access services like bank transfers, credit management, and transaction history.

**Profile Management:**
Edit user profile information, including email, phone number, and address.

**Responsive UI:**
Visually appealing interface adhering to design specifications.

**State Management:**
Efficient state management using GetX for reactive programming.

**Clean Architecture:**
Follows MVVM architecture for better separation of concerns.
Architecture
The Spiral App follows a clean architecture with the following layers:

**Model:** Data structures representing the application data (e.g., User, Appointment).
**View**: UI components and screens.
**ViewModel**: Manages the logic and interacts with the model.

**State Management**
The app utilizes GetX for state management, allowing for reactive programming. This makes it easy to manage application state and update the UI accordingly.

**Security**
Sensitive user information, such as tokens and passwords, is securely stored using the Flutter Secure Storage package.
