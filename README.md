# 🍽️ Appetizers

> A fully-featured iOS app that lets you explore thousands of meal categories, recipes, and step-by-step cooking details — built with **SwiftUI** and a clean **MVVM** architecture.


<p align="center">
  <img src="Appetizers/screenshots/category.png" width="200"/>
   <img src="Appetizers/screenshots/meals.png" width="200"/>
  <img src="Appetizers/screenshots/mealDetail.png" width="200"/>
  <img src="Appetizers/screenshots/orderDelete.png" width="200"/>
</p>


## ✨ What I Built

| Feature | Description |
|---|---|
| 🗂️ **Category Browser** | Fetches and displays all meal categories live from TheMealDB API |
| 🔎 **Search & List** | Browse meals filtered by category in real time |
| 📖 **Meal Detail View** | Full recipe steps, region info, and a YouTube video link |
| 🛒 **Order System** | Add meals to cart, create orders, and see live badge counts on the tab bar |
| 👤 **Account Management** | Save user info (name, surname, email) with built-in email validation |
| 🖼️ **Image Caching** | Downloaded images cached with `NSCache` for smooth, fast scrolling |
| 🧭 **Navigation Routing** | Tab-aware routing via a custom `AppRouter` using `NavigationStack` & `NavigationPath` |
| ⚠️ **Error Handling** | User-friendly alerts powered by `APError` and a global `AlertContext` |



## 🛠️ Tech Stack

- **Swift** & **SwiftUI** — 100% declarative UI
- **MVVM** architecture — clear separation of concerns
- **async/await** + `URLSession` — modern, clean networking
- `@Observable` — iOS 17+ reactive state management
- `@StateObject` & `@EnvironmentObject` — dependency injection through the view hierarchy
- `NavigationStack` & `NavigationPath` — programmatic, type-safe navigation
- `NSCache` — performant in-memory image caching
- `FileManager` — persistent local user data storage


## 🧩 Architecture Deep Dive

The project strictly follows **MVVM (Model-View-ViewModel)**:

```
Model       →  Codable structs (Meal, Category, User) — pure data, no logic
View        →  SwiftUI screens — only responsible for rendering UI
ViewModel   →  Business logic, API calls, state — reactive via @Observable
```

Navigation is handled by a centralized **`AppRouter`** that manages per-tab `NavigationPath` stacks, enabling seamless cross-tab routing without tight coupling between views.


## 📡 API Integration

Powered by the free [TheMealDB API](https://www.themealdb.com/api.php):

```
GET /categories.php        →  Fetch all meal categories
GET /search.php?s={meal}   →  Search meals by name
GET /lookup.php?i={id}     →  Get full meal detail by ID
```


## 📄 License

This project was built for educational purposes. Feel free to use it, fork it, and build on top of it however you like.
