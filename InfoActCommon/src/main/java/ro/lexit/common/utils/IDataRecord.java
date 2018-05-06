package ro.lexit.common.utils;

public interface IDataRecord extends IDataObject {
	
	default String getRecordTitle() { return null; }
	default String getRecordContent() { return null; }
}
