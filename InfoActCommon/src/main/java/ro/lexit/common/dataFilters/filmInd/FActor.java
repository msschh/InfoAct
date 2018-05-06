package ro.lexit.common.dataFilters.filmInd;

import ro.lexit.common.dataRecords.filmInd.Film;
import ro.lexit.common.utils.IDataFilter;

public class FActor implements IDataFilter {

	private String nume;
	private Film film;

	public String getNume() { return nume; }
	public FActor setNume(String nume) { this.nume = nume; return this; }
	
	public Film getFilm() { return film; }
	public FActor setFilm(Film film) { this.film = film; return this; }
	
}