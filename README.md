# Google & Facebook Authentication App (with Stripe Payments & AdMob)

This Flutter application demonstrates **Google and Facebook authentication**, **Stripe payment integration**, and **Google AdMob advertising** in a single project. The app showcases common real‑world features used in mobile apps — user login with social providers, secure payment flows, and ad monetization.

## 🚀 Features

### Authentication
- Sign in with **Google** using Firebase/Auth plugins :contentReference[oaicite:0]{index=0}
- Sign in with **Facebook** using `flutter_facebook_auth` plugin :contentReference[oaicite:1]{index=1}
- Secure authentication flow with Firebase or OAuth strategies

### Payments
- Accept payments using **Stripe** via the `flutter_stripe` SDK :contentReference[oaicite:2]{index=2}
- Supports payment sheets, card input, and secure transactions
- Mobile wallet support (e.g., Apple Pay / Google Pay where available) :contentReference[oaicite:3]{index=3}

### Advertising
- Integrated **Google AdMob** ads (banner / interstitial / rewarded) using Google Mobile Ads SDK :contentReference[oaicite:4]{index=4}

## 📦 Tech Stack

- **Flutter** & **Dart**
- **Firebase Auth** (optional, recommended for social sign‑in)
- **Google Sign In** (`google_sign_in`) :contentReference[oaicite:5]{index=5}
- **Facebook Auth** (`flutter_facebook_auth`) :contentReference[oaicite:6]{index=6}
- **Stripe Payments** (`flutter_stripe`) :contentReference[oaicite:7]{index=7}
- **Google Mobile Ads (AdMob)**

## 📸 Screenshots

*(Add screenshots or GIFs of your app here — e.g., login screens, payment sheet, ads)*

assets/screenshots/login.png
assets/screenshots/payment.png
assets/screenshots/ad_banner.png


## 🛠️ Getting Started

### Prerequisites

- Flutter SDK installed
- Android Studio or VS Code
- Android / iOS emulator or physical device
- Firebase project (for auth)
- Stripe account (for payments)
- AdMob account (for ads)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/abdullahawan123/Google-and-Facebook-Authentication.git
Navigate to project directory:

cd Google-and-Facebook-Authentication
Install dependencies:

flutter pub get
Configure Firebase Auth

Set up a Firebase project

Enable Google and Facebook authentication providers

Add google-services.json (Android) / GoogleService-Info.plist (iOS)

Update Firebase config in your app

Configure Stripe

Sign up at https://stripe.com and get your Publishable & Secret keys

Add keys to your app configuration (e.g., environment file)

Configure AdMob

Sign up at https://admob.google.com

Get ad unit IDs for Banner / Interstitial / Rewarded

Add IDs in your code

Run the application:

flutter run
💡 How It Works
Social Authentication
Google & Facebook login uses OAuth providers to authenticate users securely. With Firebase Auth, you can implement both providers through dedicated plugins (google_sign_in, flutter_facebook_auth) and handle tokens locally or via your backend. 

Stripe Payments
Stripe is integrated using the flutter_stripe SDK to securely collect payment details and process transactions. It supports payment sheets and wallet options for native user experience. 

Google AdMob
Google Mobile Ads plugin allows you to display banner, interstitial, and rewarded ads for monetization within your app. 

🎯 Future Enhancements
Add Firebase backend for user data and transaction history

Add push notifications for payment and login events

Add analytics and A/B testing for ads and UI

Add user profile pages and preferences

📄 License
(Add license info if available — e.g., MIT)

👤 Author
Abdullah Awan
