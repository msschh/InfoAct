package ro.lexit.common.dataFilters.filmInd;

import ro.lexit.common.dataRecords.filmInd.Film;
import ro.lexit.common.utils.IDataFilter;

public class FRecenzie implements IDataFilter {

	private Film film;

	public Film getFilm() { return film; }
	public FRecenzie setFilm(Film film) { this.film = film; return this; }
	
}