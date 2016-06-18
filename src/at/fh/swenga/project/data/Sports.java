package at.fh.swenga.project.data;

public enum Sports {
	Soccer("Soccer"), Basketball("Basketball"), Tennis("Tennis"), Volleyball("Volleyball"),
	Swimming("Swimming"), TableTennis("Table Tennis");
	
	private final String text;

    private Sports(final String text) {
        this.text = text;
    }

    @Override
    public String toString() {
        return text;
    }
}
