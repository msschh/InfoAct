package ro.lexit.app.dao.filmInd;

import org.apache.ibatis.annotations.Param;

public interface DaoFavorit {

	public Integer read(@Param("idUser") Integer idUser, @Param("idFilm") Integer idFilm);
	public void create(@Param("idUser") Integer idActor, @Param("idFilm") Integer idFilm);
	public void delete(@Param("idUser") Integer idActor, @Param("idFilm") Integer idFilm);
}