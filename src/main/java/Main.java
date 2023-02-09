import java.sql.SQLException;

public class Main {
    public static void main(String[] args) throws SQLException {

        AirTravel airTravel = new AirTravel();
        Passenger passenger = new Passenger(1L, "Bruce Willis");

        airTravel.getInfoPassenger(passenger);
        airTravel.addNewCompany();


    }
}
