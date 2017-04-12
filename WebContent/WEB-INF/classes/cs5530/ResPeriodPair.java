package cs5530;

/**
 * Data structure used to store a reservation, and a period. Used for storing data on visits that a user
 * has taken.
 * @author stone
 *
 */
public class ResPeriodPair {

	private Reservation reservation;
	private Period period;
	
	public ResPeriodPair(Reservation reservation, Period period) {
		super();
		this.reservation = reservation;
		this.period = period;
	}
	
	public Reservation getReservation() {
		return reservation;
	}
	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}
	public Period getPeriod() {
		return period;
	}
	public void setPeriod(Period period) {
		this.period = period;
	}
}
