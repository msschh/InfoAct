package ro.lexit.web.core;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.zip.DataFormatException;
import java.util.zip.Deflater;
import java.util.zip.Inflater;

public class ZipUtils {
	
	public static byte[] compress(String decompressedData) {
		byte[] input = decompressedData.getBytes();
		int decompressedDataLength = input.length;
		Deflater compressor = new Deflater();
		compressor.setLevel(Deflater.DEFAULT_COMPRESSION);
		compressor.setInput(input);
		compressor.finish();
		ByteArrayOutputStream bos = new ByteArrayOutputStream(decompressedDataLength);
		byte[] buf = new byte[1024];
		while (!compressor.finished()) {
		    int count = compressor.deflate(buf);
		    bos.write(buf, 0, count);
		}
		try {
		    bos.close();
		} catch (IOException e) {
			//
		}
		compressor.end();
		byte[] compressedData = bos.toByteArray();
		return compressedData;
	}

	public static String decompress(byte[] compressedData) {
		int compressedDataLength = compressedData.length;
		Inflater decompressor = new Inflater();
		decompressor.setInput(compressedData);
		ByteArrayOutputStream bosd = new ByteArrayOutputStream(compressedDataLength);
		byte[] buf = new byte[1024];
		while (!decompressor.finished()) {
		    try {
		        int count = decompressor.inflate(buf);
		        bosd.write(buf, 0, count);
		    } catch (DataFormatException e) {
		    	//
		    }
		}
		try {
		    bosd.close();
		} catch (IOException e) {
			//
		}
		byte[] decompressedData = bosd.toByteArray();
		String decompressedString = new String(decompressedData);
		return decompressedString;
	}
}
