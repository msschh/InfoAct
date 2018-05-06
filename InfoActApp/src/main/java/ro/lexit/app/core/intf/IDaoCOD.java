package ro.lexit.app.core.intf;

import org.apache.ibatis.annotations.Param;

import ro.lexit.common.utils.IDataRecord;

public interface IDaoCOD extends IDao {

	public IDataRecord read(@Param("cod") String cod);
	public void delete(@Param("cod") String cod);
}