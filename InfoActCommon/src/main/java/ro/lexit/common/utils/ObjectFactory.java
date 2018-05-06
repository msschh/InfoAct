package ro.lexit.common.utils;

public class ObjectFactory {

	public static Object getInstance(Class<?> cls) {
		Object result = null;
		try {
			result = cls.newInstance();
		} catch (InstantiationException ex) {
		} catch (IllegalAccessException ex) {
		} catch (SecurityException ex) {
		} catch (IllegalArgumentException ex) {
		}
		return result;
	}
}
