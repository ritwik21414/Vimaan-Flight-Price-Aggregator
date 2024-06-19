import mysql.connector
import tabulate

def connect_to_db():
    try:
        conn = mysql.connector.connect(
            host="127.0.0.1",
            user="root",
            password="ritwik0807",
            database="merged"
        )
        print("\nWelcome to Vimaan: the Flight Price Aggregator\n")
        return conn
    except mysql.connector.Error as err:
        print(f"Error connecting to MySQL Database: {err}")
        return None

def fetch_data(conn, source, destination, airline, sorting):
    if conn:
        try:
            cursor = conn.cursor()

            sort_column_map = {
                "Departing Time": "departing_time",  # Replace with actual column names
                "Arriving Time": "arriving_time",    # Replace with actual column names
                "Duration": "duration"               # Replace with actual column names
            }

            if sorting and sorting not in sort_column_map:
                print("Invalid sorting option. Valid options are: Departing Time, Arriving Time, Duration")
                return

            base_query = "SELECT * FROM price WHERE DepartingCity = %s AND ArrivingCity = %s"
            params = [source, destination]

            if airline:
                base_query += " AND FlightName = %s"
                params.append(airline)

            if sorting:
                sort_column = sort_column_map[sorting]
                base_query += f" ORDER BY {sort_column}"

            cursor.execute(base_query, params)
            records = cursor.fetchall()

            if records:
                headers = [i[0] for i in cursor.description]
                print(tabulate.tabulate(records, headers=headers, tablefmt="pretty"))
            else:
                print("No flights found for the given source and destination")
        except mysql.connector.Error as err:
            print(f"Error fetching data: {err}")
        finally:
            cursor.close()
    else:
        print("Not connected to the database")

def main():
    connection = connect_to_db()
    if connection:
        while True:
            source = input("Enter source ('exit' to quit): ")
            if source.lower() == "exit":
                connection.close()
                print("Thank You.\nPlease Visit Again.")
                break
            else:
                destination = input("Enter destination: ")
                sorting = input("Sort by Departing Time/Arriving Time/Duration (leave blank for no sorting): ")
                airline = input("Preferred Airline (if any): ")
                print("\nPlease hang on as we find the best flight prices across platforms")
                fetch_data(connection, source, destination, airline, sorting)

if __name__ == "__main__":
    main()
