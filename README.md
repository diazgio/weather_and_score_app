# Weather and Soccer Data App

This is a Ruby on Rails application that displays weather and football data. The app extracts data from text files and displays the day with the smallest temperature variation and the team with the smallest goal difference in the English Premier League.

## Clone and Installation

Follow these steps to clone the repository and run the app locally.

### Clone Repository

1. Clone the repository from GitHub:
   ```bash
   git clone https://github.com/tu-usuario/weather_and_score_app.git
   ```
2. Change to the project directory:
   ```bash
   cd weather_and_score_app
   ```

### Installation of Dependencies

1. Install Ruby dependencies:
   ```bash
   bundle install
   ```

### Initialize the Database

```bash
   rails db:create
```

### Run the Server

1. Run the Rails server:
   ```bash
   rails server
   ```
2. Open your browser and navigate to `http://localhost:3000` to see the app in action.

## Endpoints

The application has the following endpoints:

1. **`/`**: Home page with links to weather and football data views.
2. **`/weather`**: Shows the day with the smallest temperature variation.
3. **`/soccer`**: Shows the team with the smallest goal difference.

## Application Description

The application has two main functions:

1. **Meteorological Data**: It reads data from a file called `w_data.dat` and finds the day with the smallest temperature variation. The temperature variation is calculated as the difference between the maximum and minimum temperature for each day.

2. **Soccer Facts**: It reads the data from a file called `soccer.dat` and finds the team with the smallest difference between goals for and against. Goal difference is calculated as the absolute value of the difference between goals scored and goals conceded.

## Data Files

- **w_data.dat**: Contains daily weather data.
- **soccer.dat**: Contains results from the English Premier League.

Make sure to place these files in the `app/assets/data` directory so that the application can read them correctly.

## Contribution

If you would like to contribute to this project, please follow these steps:

1. Fork the project.
2. Create a branch for your new feature (`git checkout -b feature/new-feature`).
3. Make your changes and commit (`git commit -am 'Add new feature'`).
4. Push the changes to your branch (`git push origin feature/new-feature`).
5. Create a Pull Request.

## License

This project is licensed under the MIT License. For more details, see the `LICENSE` file.
