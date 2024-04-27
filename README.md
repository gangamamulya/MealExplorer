# MealExplorer

MealExplorer is a native iOS application developed in SwiftUI, designed to help users browse and explore recipes specifically within the dessert category. Utilizing data from TheMealDB API, it provides a clean and interactive way to view meal details including ingredients and cooking instructions.

## Features

- **Browse Desserts**: Users can scroll through a alphabetically sorted list of dessert recipes.
- **Detailed View**: On selection, the app presents detailed information about the recipe, including preparation instructions and required ingredients.

## Prerequisites

- Xcode 15 or later

## Installation

To set up the project locally:

1. Clone the repository:

git clone https://github.com/gangamamulya/MealExplorer

2. Open `MealExplorer.xcodeproj` in Xcode.
3. Select your target device or simulator.
4. Press `Cmd + R` to build and run the application.

## Architecture

MealExplorer is structured using the MVVM (Model-View-ViewModel) architecture pattern, enhancing the separation of concerns and simplifying the management of UI state and business logic.

### Components

- **Model**: Holds the data access layer and business logic.
- `MealDetailedResponse`: Structures the detailed data received from the API: https://themealdb.com/api/json/v1/1/filter.php?c=Dessert
- `MealResponse`: Structures the list of meals data received from the API: https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID

- **View**: Responsible for rendering the UI elements which the user interacts with.
- `MealDetailedView`: Displays the detailed information of a meal.
- `MealView`: Shows the list of meals and handles user interactions.

- **ViewModel**: Acts as a bridge between the Model and the View, managing the flow of data.
- `MealDetailedViewModel`: Manages the data for the `MealDetailedView`.
- `MealViewModel`: Manages the data for the `MealView`.

- **Service**: Handles the network communication and data fetching.
- `MealDetailedService`: Fetches detailed meal information from the API.
- `MealService`: Fetches the list of meals from the API.

- **Protocol**: Defines interfaces for the services.
- `MealDetailedServiceProtocol`: Interface for the detailed meal fetching service.
- `MealServiceProtocol`: Interface for the meal fetching service.

## Testing

MealExplorer includes comprehensive testing using mock services for different data scenarios:

- **MockMealService and MockDetailedService**:
- For **Good Data**: Tests how the application processes correct and expected data inputs.

- **MockFailureService and MockDetailedFailureMealService**:
- For **Bad Data**: Tests the application's error handling capabilities when faced with incorrect or malformed data.

- **MockEmptyMealService and MockDetailedEmptyMealService**:
- For **Empty Data**: Ensures that the application handles situations where no data is available, testing its robustness and stability.

Tests can be executed from the `MealExplorerTests` directory by pressing `Cmd + U` in Xcode.

