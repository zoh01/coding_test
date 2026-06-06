# Node JS

## 📖 Introduction
In today's digital age, content creation has become more important than ever. However, many blogging platforms are either too complex for beginners or lack the features professionals need.

<div align="center">
  
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)

A comprehensive hostel management solution built with Flutter for seamless administration and guest management.

[Features](#-features) • [Installation](#-installation) • [Architecture](#-my-approach) • [Tech Stack](#-tools-and-libraries-used)

</div>

---

## 📖 Introduction
A sleek, modern weather application built with Flutter that provides real-time weather information and forecasts for any location worldwide. Get accurate weather updates with a beautiful, intuitive interface.

---

## ✨ Features
### 🌤️ Weather Information
### 🔐 User Management & Authentication
### 🏠 Room Management
### 🔔 Additional Features

---

## 🛠️ My Approach
### Architecture Pattern

---

## 🛠️ Tech Stack
    # Core
    flutter: ^3.0.0
    dart: ^3.0.0
    
    # State Management
    provider: ^latest              # State management
    # or flutter_bloc: ^latest

    # Networking
    http: ^latest                  # HTTP requests
    dio: ^latest                   # Advanced HTTP client

    # Location
    geolocator: ^latest            # GPS location
    geocoding: ^latest             # Reverse geocoding

    # UI
    google_fonts: ^latest          # Custom fonts
    intl: ^latest                  # Date formatting
    lottie: ^latest               # Animations
    cached_network_image: ^latest  # Image caching

    # Storage
    shared_preferences: ^latest    # Local storage

### Get Your API Key
1. Visit [OpenWeatherMap](https://openweathermap.org/api)
2. Sign up for a free account
3. Navigate to **API Keys** section
4. Copy your **API key**
5. Paste it in api.env file

---

## 🚀 Installation
### Prerequisites
- Flutter SDK (3.0+)
- OpenWeatherMap API Key [Get Free API Key](https://openweathermap.org/api)

---

### Setup
    # 1. Clone repository
    git clone https://github.com/zoh01/weather_apis.git
    cd weather_apis
    
    # 2. Install dependencies
    flutter pub get
    
    # 3. Configure API Key
    # Open api.env file and add your API key:
    echo "WEATHER_API_KEY=your_api_key_here" > api.env
    
    # 4. Run the app
    flutter run
