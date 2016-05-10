package katy.bordercollie.filter;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * Filter này đảm bảo rằng tất cả các class cần thiết đều được đăng
 * ký objectify.
 * 
 * @author xuanhung2401@gmail.com
 * 
 * @doc Apr 16, 2016 1:42:02 AM
 */
public class GeneralFilter implements Filter {

	private static final Logger LOGGER = Logger.getLogger(GeneralFilter.class.getName());

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		/**
		 * Đăng ký objectify class.
		 */
		LOGGER.info("Gọi general filter.");
		chain.doFilter(req, resp);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}
}
