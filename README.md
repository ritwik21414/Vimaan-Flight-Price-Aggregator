Vimaan: Flight Price Aggregator

Overview

Vimaan is a command-line application designed to help users find the best flight prices between specified cities. The application connects to a MySQL database, retrieves flight information based on user input, and displays the results in a tabulated format. Users can filter results by departing city, arriving city, preferred airline, and sort the results by departing time, arriving time, or duration.

Features

- Connects to a MySQL database.
- Fetches and displays flight prices based on user input.
- Allows sorting of results by departing time, arriving time, or duration.
- Filters results by preferred airline.

Prerequisites

- Python 3.x
- mysql-connector-python package
- tabulate package
- MySQL server with a database named merged containing a table price with relevant flight information.

Installation

1. Ensure Python 3.x is installed on your system.
2. Install the required Python packages using pip:

   bash
   pip install mysql-connector-python tabulate
   

3. Ensure MySQL server is running and accessible with the specified credentials.

Database Setup

Make sure your MySQL database has the following setup:

- Database: merged
- Table: price

The price table should contain at least the following columns (replace with actual column names as necessary):

- DepartingCity
- ArrivingCity
- FlightName
- departing_time
- arriving_time
- duration
- Any other columns relevant to flight details

Configuration

Update the database connection details in the connect_to_db function:

conn = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="your_password",
    database="merged"
)


Usage

Run the script using Python:

python vimaan.py

Follow the on-screen prompts to enter the source city, destination city, sorting option, and preferred airline. The application will display the flight prices in a tabulated format.

Code Explanation

Functions

1. connect_to_db(): Establishes a connection to the MySQL database and returns the connection object.
2. fetch_data(conn, source, destination, airline, sorting): Fetches flight data from the database based on user input and displays it in a tabulated format.
3. main(): The main function that drives the program. It prompts the user for input and calls the appropriate functions to display the results.

Main Loop

The main loop continues to prompt the user for input until 'exit' is entered as the source city. It then closes the database connection and exits the program.

Example

1. Enter source ('exit' to quit): New Delhi
2. Enter destination: Mumbai
3. Sort by Departing Time/Arriving Time/Duration (leave blank for no sorting): Departing Time
4. Preferred Airline (if any): Indigo

The application will then fetch and display the flight prices for Delta flights from New York to Los Angeles, sorted by departing time.

Troubleshooting

- Database Connection Error: Ensure the MySQL server is running and the connection details (host, user, password, database) are correct.
- No Flights Found: Verify that the price table contains data for the specified source and destination.


Thank you for using Vimaan: the Flight Price Aggregator. Please visit again!
