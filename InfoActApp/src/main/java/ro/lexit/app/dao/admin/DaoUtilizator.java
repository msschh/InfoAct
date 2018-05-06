package ro.lexit.app.dao.admin;

import org.apache.ibatis.annotations.Param;

import ro.lexit.app.core.intf.IDaoID;

public interface DaoUtilizator extends IDaoID { 
	public void createRoluri(@Param("idUtilizator") Integer IdUtilizator, @Param("idRol") Integer IdRol); 
	public void deleteRoluri(@Param("idUtilizator") Integer IdUtilizator); 
}