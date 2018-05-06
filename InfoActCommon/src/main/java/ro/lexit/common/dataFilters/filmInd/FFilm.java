package ro.lexit.common.dataFilters.filmInd;

import ro.lexit.common.dataRecords.admin.Utilizator;
import ro.lexit.common.dataRecords.filmInd.Actor;
import ro.lexit.common.utils.IDataFilter;

public class FFilm implements IDataFilter {

	private String nume;
	private Actor actor;
	private Utilizator user;

	public String getNume() { return nume; }
	public FFilm setNume(String nume) { this.nume = nume; return this; }
	
	public Actor getActor() { return actor; }
	public FFilm setActor(Actor actor) { this.actor = actor; return this; }
	
	public Utilizator getUser() { return user; }
	public FFilm setUser(Utilizator user) { this.user = user; return this; }
}