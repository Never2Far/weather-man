# weather-man

The weather-man is a simple, CLI weather forecast app written in Ruby and using the National Weather Service (NWS) for weather data.  Since people don't usually have latitude/longitde coordinates memorized, the app takes a user's input (a loaction search) and queries the Mapquest API in order to geocode (address or location => coordinates) the location.  Next, the app uses the coordinates returned from Mapquest and passes them on to the National Weather Service's API.  The NWS provides an API that accepts coordinates (lat. & long.), and returns the name of the weather grid that encompasses that location. Using a separate endpoint provided by the NWS API, that weather grid can then be used to find various types of weather forecasts for that area (summary, hourly, 3-day, etc.).

For convenience, the app allows a user to save their searched locations, however this data does not persist once the app is closed.

This app was created to satisfy the requirements of The Flatiron School's CLI Data Gem Portfolio Project. This project was focused on creating an application with consise, easy-to-read, Object-Oriented Ruby. The project also show-cases the use of external API's (or scraped sites) to bring external data into the app.

## Installation

First, run
```bash
bundle install
```
to install required gems/dependencies.

Next navigate to the /bin directory using
```bash
cd bin
```

and finally enter
```bash
ruby run.rb
```
to start the application.

## Usage

To use the app, simply follow the prompts provided on the CLI.
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)