package ro.lexit.common.dataRecords.filmInd;

import java.util.Date;

import ro.lexit.common.dataRecords.admin.Utilizator;
import ro.lexit.common.utils.DataRecordID;

public class Recenzie extends DataRecordID {
	private Date dt;
	private Integer nota;
	private String text;
	private Film film;
	private Utilizator user;

	public Date getDt() { return dt; }
	public Recenzie setDt(Date dt) { this.dt = dt; return this; }
	
	public Integer getNota() { return nota; }
	public Recenzie setNota(Integer nota) { this.nota = nota; return this; }
	
	public String getText() { return text; }
	public Recenzie setText(String text) { this.text = text; return this; }
	
	public Film getFilm() { return film; }
	public Recenzie setFilm(Film film) { this.film = film; return this; }
	
	public Utilizator getUser() { return user; }
	public Recenzie setUser(Utilizator user) { this.user = user; return this; }	
}