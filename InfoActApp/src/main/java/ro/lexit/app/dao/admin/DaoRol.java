package ro.lexit.app.dao.admin;

import org.apache.ibatis.annotations.Param;

import ro.lexit.app.core.intf.IDaoID;

public interface DaoRol extends IDaoID { 
	public void createDrepturi(@Param("idRol") Integer IdRol, @Param("idDrept") Integer IdDrept); 
	public void deleteDrepturi(@Param("idRol") Integer idRol); 
}