package ro.lexit.app.core.intf;

import org.apache.ibatis.annotations.Param;

import ro.lexit.common.utils.IDataRecord;

public interface IDaoID extends IDao {

	public IDataRecord read(@Param("id") Integer id);
	public void delete(@Param("id") Integer id);
}
