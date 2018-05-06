package ro.lexit.app.dao.filmInd;

import org.apache.ibatis.annotations.Param;

public interface DaoActorFilm {

	public void create(@Param("idActor") Integer idActor, @Param("idFilm") Integer idFilm, @Param("personaj") String personaj);
	public void delete(@Param("idActor") Integer idActor, @Param("idFilm") Integer idFilm);
}