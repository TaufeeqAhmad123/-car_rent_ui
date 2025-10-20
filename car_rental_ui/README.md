# Car Rent App

A beautiful Flutter app with onboarding screens and a modern home screen design.

## Features

### Onboarding Screen
- Full-screen images with gradient overlay
- Smooth page transitions
- Animated text and buttons using `animate_do` package
- Dot indicators showing current page
- Skip button to jump directly to home
- Beautiful animations: FadeIn, SlideIn, BounceIn effects

### Home Screen
- Floating bottom navigation bar
- Custom container with rounded bottom corners
- Header with profile, location, and notification icon
- Search bar with filter option
- Category cards with gradients
- Popular cars listing
- Smooth animations throughout

## Dependencies

- `smooth_page_indicator`: For onboarding dot indicators
- `animate_do`: For beautiful animations
- `google_fonts`: For custom typography

## Getting Started

1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Add your onboarding images:
   - Create `assets/images/` folder
   - Add three images: `onboarding1.jpg`, `onboarding2.jpg`, `onboarding3.jpg`

3. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
  ├── main.dart                    # App entry point
  └── screens/
      ├── onboarding_screen.dart   # Onboarding with animations
      └── home_screen.dart         # Home screen with floating navbar
```

## Customization

You can customize:
- Onboarding images and text in `onboarding_screen.dart`
- Colors and gradients in both screen files
- Category items in home screen
- Car listings and details

Enjoy your beautiful car rent app! 🚗
