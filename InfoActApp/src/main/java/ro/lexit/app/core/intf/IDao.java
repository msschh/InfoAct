package ro.lexit.app.core.intf;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import ro.lexit.common.utils.DataQuery;
import ro.lexit.common.utils.IDataRecord;

public interface IDao {

	public int readRecordCount(@Param("qry") DataQuery qry);
	public List<IDataRecord> readList();
	public List<IDataRecord> readList(@Param("qry") DataQuery qry);
	public List<IDataRecord> readList(@Param("qry") DataQuery qry, RowBounds rb);

	public void update(@Param("record") IDataRecord record);
	public void create(@Param("record") IDataRecord record);

}
