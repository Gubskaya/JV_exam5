import java.sql.*;
import java.util.Scanner;

public class AirTravel {
    private final String URL = "jdbc:postgresql://localhost:5432/air_travel";
    private final String USER = "postgres";
    private final String PASSWORD = "postgres";

    public Connection connect() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Connected to the PostgreSQL server successfully.");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return connection;
    }

    public void getInfoPassenger (Passenger passenger) {
        String SQL = "SELECT passenger.passenger_name, company.company_name, trip.plane, trip.town_from, trip.town_to\n" +
                "FROM passenger JOIN pass_in_trip ON passenger.id = pass_in_trip.passenger_id\n" +
                "JOIN trip ON pass_in_trip.trip_id = trip.id\n" +
                "JOIN company ON trip.company_id = company.id\n" +
                "WHERE passenger.id = " + passenger.getId() +";";

        try (Connection connection = connect()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String passengerName = resultSet.getString("passenger_name");
                String companyName = resultSet.getString("company_name");
                String plane = resultSet.getString("plane");
                String townFrom = resultSet.getString("town_from");
                String townTo = resultSet.getString("town_to");

                System.out.println("Passenger name: " + passengerName + "\nCompany name: " + companyName +
                        "\nPlane: " + plane + "\nTown from: " + townFrom + "\nTown to: " + townTo);
            }


        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public void addNewCompany () {
        String SQL = "INSERT INTO company (company_name) VALUES (?);";
        Scanner scanner = new Scanner(System.in);
        System.out.println("Введите название компании, которую хотите добавить:");
        String name = scanner.nextLine();
        try (Connection connection = connect()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, name);

            int rows = preparedStatement.executeUpdate();
            System.out.printf("%d rows added", rows);


        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
}
