package katy.bordercollie.controller;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import katy.bordercollie.entity.Article;
import katy.bordercollie.entity.Category;

@SuppressWarnings("serial")
public class HomeServlet extends HttpServlet {

	private static final Logger LOGGER = Logger.getLogger(HomeServlet.class.getName());

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		try {
			LOGGER.info("Gọi home servlet.");
			int limit = 10;
			int page = 1;
			try {
				page = Integer.parseInt((String) req.getParameter("page"));
			} catch (Exception e) {
				page = 1;
			}

			List<Article> listArticle = ofy().load().type(Article.class).limit(limit + 1).offset((page - 1) * limit)
					.filter("status in", Arrays.asList(1, 2, 3)).order("-doc").list();

			List<Category> listCategory = ofy().load().type(Category.class).list();

			boolean hasNextPage = listArticle.size() > limit;
			if (hasNextPage) {
				listArticle.remove(listArticle.size() - 1);
			}

			req.setAttribute("listArticle", listArticle);
			req.setAttribute("listCategory", listCategory);
			req.setAttribute("page", page);
			req.setAttribute("hasNextPage", hasNextPage);
			req.setAttribute("serverName", req.getServerName());
			req.setAttribute("requestUrl", req.getRequestURL().toString());
			req.setAttribute("page", page);
			req.setAttribute("page", page);
			req.setAttribute("page", page);

			req.getRequestDispatcher("/home.jsp").forward(req, resp);
		} catch (Exception e) {
			LOGGER.severe("Xảy ra lỗi trong quá trình xử lý home page.");
			e.printStackTrace(System.err);
			resp.sendError(500);
		}
	}
}
