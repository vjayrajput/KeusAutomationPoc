# Food Delivery App

## Project Overview Description

This is a Flutter-based food delivery application that allows users to browse categories, view
products, add items to their cart, and manage their orders.

It leverages the BLoC (Business Logic Component) pattern for state management, Clean Architecture
for maintainability and scalability, and a local database (SQLite) for data persistence.


## Features

- **Category Browsing**: Users can view different food categories.
- **Product Details**: Each product can be clicked to view its details, including an image, name,
  description, and price.
- **Cart Management**: Users can add products to their cart, increase/decrease quantities, and
  manage cutlery count.
- **Dynamic UI**: The app dynamically displays the cart and updates the total price based on the
  selected items and delivery charges.
- **Data Fetching**: The app fetches categories and products from a local data source.

## Architecture

The app is organized into layers that separate the business logic, data management, and
presentation. This modular approach enhances maintainability and allows for easier testing of
individual components. This project follows a clean architecture pattern, separating the application
into layers:

- **Presentation Layer**: Responsible for the UI components.
  In this app, Flutter widgets represent the UI, and the BLoC manages the state and
  handles user interactions.
- **Domain Layer**: Contains the business logic of the application. It defines use cases and
  entities, ensuring that business rules are followed. This layer is independent of any external
  dependencies.
- **Data Layer**: Handles data retrieval and storage, utilizing local data sources.
- **BLoC Pattern**: The BLoC pattern is employed to manage state and business logic. Each BLoC
  listens for events and emits states, allowing the UI to react to changes seamlessly. The use of
  streams enables a reactive programming model, making it easier to handle asynchronous data and
  user interactions.
  BLoCs are decoupled from the UI, ensuring that the presentation layer is clean and focused solely
  on rendering views.
- **Local Database (SQLite)**: The app utilizes SQLite for local data persistence, enabling it to
  store and retrieve data efficiently. The sqflite package is used to interact with the SQLite
  database.


## Screenshots

<table>
  <tr>
    <td align="center"><img src="https://github.com/vjayrajput/KeusAutomationPoc/blob/cart_detail_page/screenshots/Screenshot_20240930_133715.png" alt="Screenshot 1" width="350"/></td>
    <td align="center"><img src="https://github.com/vjayrajput/KeusAutomationPoc/blob/cart_detail_page/screenshots/Screenshot_20240930_133753.png" alt="Screenshot 3" width="350"/></td>
    </tr>
<tr>
   <td align="center"><img src="https://github.com/vjayrajput/KeusAutomationPoc/blob/cart_detail_page/screenshots/Screenshot_20240930_133823.png" alt="Screenshot 4" width="350"/></td>
   <td align="center"><img src="https://github.com/vjayrajput/KeusAutomationPoc/blob/cart_detail_page/screenshots/Screenshot_20240930_133902.png" alt="Screenshot 5" width="350"/></td>
</tr>
  <tr>
   <td align="center"><img src="https://github.com/vjayrajput/KeusAutomationPoc/blob/cart_detail_page/screenshots/Screenshot_20240930_133927.png" alt="Screenshot 6" width="350"/></td>
    <td align="center"><img src="https://github.com/vjayrajput/KeusAutomationPoc/blob/cart_detail_page/screenshots/Screenshot_20240930_134002.png" alt="Screenshot 7" width="350"/></td>
  </tr>
</table>

## Videos

[Watch the demo video 1](videos/video_1.mp4)

[Watch the demo video 2](videos/video_2.mp4)

## Dependencies

This project utilizes several packages to enhance functionality and maintainability. Below is a
brief description of each dependency:

- **Get It**: FetIt is a simple service locator for Dart and Flutter projects. It helps manage the
  application's dependencies, making it easier to retrieve instances of classes throughout the app
  without needing to pass them around. This promotes a clean and maintainable architecture.
- **Sqflite**: Sqflite is a Flutter plugin for SQLite, a lightweight database. It allows developers
  to store and manage local data efficiently. This library provides a simple API to perform CRUD
  operations and is essential for applications that require persistent data storage.
- **Flutter Bloc**: Flutter bloc is a state management library that implements the BLoC (Business
  Logic Component) pattern. It separates business logic from UI components, making the application
  more testable and maintainable. This library provides tools for managing and reacting to state
  changes, promoting a reactive programming model in Flutter apps.
- **Flutter Toast**: Flutter toast is a Flutter plugin that allows you to show toast messages on the
  screen. Toasts are brief messages that provide feedback to the user about an operation or action.
  This library makes it easy to implement user notifications in a non-intrusive manner.
- **Dartz**: Dartz is a functional programming library for Dart. It provides data types and tools
  for managing immutability, options, futures, and more, facilitating a functional style of
  programming. It's particularly useful for handling asynchronous operations and enhancing code
  readability through its powerful type system.
- **Freezed**: Freezed is a code generation package for Dart that helps create immutable classes,
  unions, and sealed classes. It simplifies data modeling by generating boilerplate code for value
  equality, copy methods, and pattern matching. This is particularly beneficial in Flutter for
  managing state in a clear and type-safe way.

## License

This project is licensed under the MIT License. See the LICENSE file for more information.

## Contributing

Contributions are welcome! If you'd like to contribute to this project, please fork the repository
and submit a pull request.

## Acknowledgments

- Flutter framework
- BLoC library
- Clean architecture principles

