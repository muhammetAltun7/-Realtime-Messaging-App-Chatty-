# Chatty

Chatty is a real-time messaging application that I developed using Flutter. Users can create an account, log in, and send instant messages to other users.

I developed the application using Firebase Authentication, Cloud Firestore, and Provider-based state management.
<img width="294" height="619" alt="1" src="https://github.com/user-attachments/assets/d5fb6f6b-bdf1-4a1a-b09f-c89690e1ec91" />

<img width="291" height="616" alt="3" src="https://github.com/user-attachments/assets/25e39d89-22a2-4191-ad69-a74a5599d8fb" />

<img width="291" height="619" alt="2" src="https://github.com/user-attachments/assets/c556e11c-d64d-482c-893f-a7364820cd23" />

<img width="290" height="615" alt="5" src="https://github.com/user-attachments/assets/6dce2472-b824-499c-abbf-6722680358a1" />

<img width="289" height="618" alt="4" src="https://github.com/user-attachments/assets/e4a825b8-5d1d-420a-9185-8bbd7153913f" />

---

## Features

🔐 User Authentication  
- Sign up with Firebase Authentication  
- User login  
- Secure logout  

💬 Real-Time Messaging  
- Send messages between users  
- Store messages using Firestore  
- Real-time data updates  

⚙️ State Management  
- Application state management using Provider  

🎨 Flutter UI  
- Material Design components  
- Custom widget usage  

---

## 🛠 Technologies Used

- Flutter  
- Dart  
- Firebase Authentication  
- Cloud Firestore  
- Provider  

---

## 📂 Project Structure

```bash
lib/

components/          # Reusable widgets
- left_chat_bubble.dart
- right_chat_bubble.dart
- my_button.dart
- my_textfield.dart
- my_message_text_field.dart

images/              # App images
- chick.png
- user.png

model/               # Data models
- message.dart

pages/               # Application screens

services/            # Firebase services
auth/
- auth_gate.dart
- auth_service.dart

chat/
- chat_service.dart

firebase_options.dart
main.dart
```

---

## 🔥 Firebase Services

I used Firebase services for this project.

- Firebase Authentication → User authentication system  
- Cloud Firestore → Real-time message database  

---

## 🚀 Setup Instructions

📦 **Extract the Project**  
- Download the repository and extract the ZIP file to a permanent folder on your computer.

🛠 **Open in Android Studio**  
- Open Android Studio and select the **chatty** folder as the project root.

⚙️ **Configure SDK**  
- If you see a *"Dart SDK is not configured"* warning at the top, click on **"Open Dart settings"**  
- Ensure the **"Enable Dart support for the project 'chatty'"** checkbox is ticked  
- Select your local Flutter SDK path *(e.g., `C:\src\flutter`)*  

📥 **Fetch Dependencies**  
- Open the terminal in Android Studio and run:

```bash
flutter pub get
```

▶️ **Run the App**  
- Select your emulator or physical device  
- Press the **Run (▶️)** button in Android Studio  

---

## Developer

**MUHAMMET ALTUN**  
Computer Engineering Student 🚀  
