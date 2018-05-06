package ro.lexit.web.core;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import org.springframework.stereotype.Component;
import org.springframework.web.WebApplicationInitializer;

@Component
public class Initializer implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		// do nothing
	}
}
