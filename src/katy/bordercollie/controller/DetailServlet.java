package katy.bordercollie.controller;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import katy.bordercollie.entity.Article;
import katy.bordercollie.entity.Category;

@SuppressWarnings("serial")
public class DetailServlet extends HttpServlet {

	private static final Logger LOGGER = Logger.getLogger(DetailServlet.class.getName());

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		try {
			LOGGER.info("Gọi detail servlet.");
			String id = req.getParameter("id");
			Article article = ofy().load().type(Article.class).id(id).now();

			List<Category> listCategory = ofy().load().type(Category.class).list();
			req.setAttribute("listCategory", listCategory);
			req.setAttribute("article", article);
			req.setAttribute("serverName", req.getServerName());
			req.setAttribute("requestUrl", req.getRequestURL().toString());
			req.getRequestDispatcher("/detail.jsp").forward(req, resp);
		} catch (Exception e) {
			LOGGER.severe("Xảy ra lỗi trong quá trình xử lý home page.");
			e.printStackTrace(System.err);
			resp.sendError(500);
		}
	}
}
