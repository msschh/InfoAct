package ro.lexit.web.core;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Component
public class WebUtils {

	@Autowired private ServletUtils servletUtils; 
	
	public void exposeContent(
			
			  HttpServletResponse response
			, byte[] content 		// continutul fisierului
			, String contentType 	// tipul fisierului XLS, etc
			, boolean forDownload 	// dc trebuie downloadat sau nu
			, String contentTitle 	// titlul cu care va fi salvat
			
	) throws IOException {

		response.setContentType(contentType);
		response.setHeader("Content-disposition", forDownload ? ("attachment;filename=" + contentTitle) : ("inline;filename=" + contentTitle));
		ServletOutputStream servletStream = response.getOutputStream();
		servletStream.write(content);
		servletStream.flush();
		servletStream.close();
	}

	public void exposeForDownload(HttpServletResponse response, byte[] content, String contentType, String contentTitle)
			throws IOException {
		exposeContent(response, content, contentType, true, contentTitle);
	}
	
	public void exposeInline(HttpServletResponse response, byte[] content, String contentType, String contentTitle)
			throws IOException {
		exposeContent(response, content, contentType, false, contentTitle);
	}
	
	public void uploadFile(CommonsMultipartFile file, String filename) throws IOException {
        InputStream inputStream = file.getInputStream();
        OutputStream outputStream = new FileOutputStream(filename);
        int readBytes = 0;
        byte[] buffer = new byte[1024];
        while ((readBytes = inputStream.read(buffer, 0, 1024)) != -1) {
                outputStream.write(buffer, 0, readBytes);
        }
        outputStream.close();
        inputStream.close();
	}
	
	public void deleteFile(String filename) throws IOException {
		File file = new File(filename);
		file.delete();
	}

	public byte[] getFileAsByteArray(String filePath) throws IOException {
        // filepath = "/WEB-INF/ftp/electricitatea/aaa.pdf";
		InputStream inputStream = servletUtils.getServletContext().getResourceAsStream(filePath);
		if (inputStream == null) {
			throw new IOException("Nu exista facturas in format electronic");
		}
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        int len;
        byte[] buf = new byte[1024];        
		while((len = inputStream.read(buf)) > 0) {
		    outputStream.write(buf, 0, len);
		}
        byte[] result = outputStream.toByteArray();    
        outputStream.flush();		// dan: a-t-on besoin de ca?
        outputStream.close(); 		// dan: a-t-on besoin de ca?
        return result;
        
        /*
        URL url = new URL("http://localhost:8080/keputl/img/warning.png");
        URLConnection connection = url.openConnection();
        InputStream stream = connection.getInputStream();
        BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
        int len;
        byte[] buf = new byte[1024];
        while ((len = stream.read(buf)) > 0) {
            outs.write(buf, 0, len);
        }
        outs.close();
        */
	}
	
}