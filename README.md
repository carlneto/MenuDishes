# 🍽️ MenuDishes

---

## 1. Project Title
**MenuDishes** – An interactive SwiftUI application showcasing typical dishes with descriptions, images, and ingredients.

---

## 2. Short Description
MenuDishes is a SwiftUI-based iOS app that allows users to:
- Browse a list of traditional dishes.
- Search by dish name or ingredients.
- View detailed descriptions and images.
- Hear dish names using text-to-speech functionality.
- Export a structured HTML representation of the menu.

---

## 3. Requirements
- **iOS**: 16.0 or later  
- **Xcode**: 15.0 or later  
- **Swift**: 5.9+  

---

## 4. Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/MenuDishes.git
````

2. Open the project in Xcode:

   ```bash
   cd MenuDishes
   open MenuDishes.xcodeproj
   ```
3. Build and run the app on a simulator or physical device.

---

## 5. Usage

1. Launch the app on your device.
2. Browse dishes in the main list.
3. Use the search bar to filter dishes by name or ingredients.
4. Tap on a dish to see:

   * Detailed description
   * Ingredients
   * Multiple images
   * Option to play the dish name using text-to-speech
5. Optionally, generate an HTML version of the menu:

   ```swift
   let htmlContent = htmlStr(from: data, title: "Typical Dishes", appName: "MenuDishes")
   print(htmlContent)
   ```

---

## 6. Project Structure

```
MenuDishes/
├── MenuDishesApp.swift        // App entry point
├── ContentView.swift          // Main list and search interface
├── DishDetailView.swift       // Detailed view for individual dishes
├── Models/
│   └── Dish.swift             // Dish data structure
├── Resources/
│   └── Images/                // Dish images
└── Utilities/
    └── String+Extensions.swift // String helper extensions
```

* **ContentView.swift** – Displays the searchable list of dishes.
* **DishDetailView.swift** – Shows dish details with images and TTS functionality.
* **Dish.swift** – Defines the `Dish` model structure.
* **String+Extensions.swift** – Contains helper methods for search and text cleaning.

---

## 7. Key Features

* **Searchable List**: Filter dishes by name or ingredients with multi-word search.
* **Dish Details**: Images, description, ingredients.
* **Text-to-Speech**: Reads out the dish name using `AVSpeechSynthesizer`.
* **HTML Export**: Generates an HTML version of the menu for PDF conversion or sharing.
* **Responsive UI**: SwiftUI layout optimized for all iPhone devices.

---

## 8. License

**Restricted Use License** – This software is not open source.

* **Personal, private use** is allowed for evaluation and testing.
* **Modification, distribution, or commercial use** is strictly prohibited without written permission from the Author.
* **No warranties** are provided; the software is used at your own risk.

Full license details are in the `LICENSE` file.

---

## 9. Credits / Authors

* **Author**: © 2025 carlneto
* Developed using **SwiftUI**, **AVFoundation**, and standard iOS frameworks.
