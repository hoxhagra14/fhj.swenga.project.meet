package at.fh.swenga.project.data;

public enum Games {
	CallOfDuty4("Call of Duty 4"), Battlefield2("Battlefield 2"), WorldOfWarcraft("World of Warcraft"),
	CounterStrike("Counter Strike");
	
	private final String text;

    private Games(final String text) {
        this.text = text;
    }

    @Override
    public String toString() {
        return text;
    }
}
