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
import katy.bordercollie.helper.StaticItem;

@SuppressWarnings("serial")
public class ArticleController extends HttpServlet {

	private static final Logger LOGGER = Logger.getLogger(ArticleController.class.getName());

	private static final String PARAMETER_ID = "id";
	private static final String PARAMETER_CATEGORY = "category";
	private static final String PARAMETER_AUTHOR = "author";
	private static final String PARAMETER_TIME = "time";
	private static final String PARAMETER_PAGE = "page";
	private static final String PARAMETER_LIMIT = "limit";

	private static final String ATTRIBUTE_ARTICLE = "article";
	private static final String ATTRIBUTE_SERVER = "server";
	private static final String ATTRIBUTE_URL = "url";

	private static final String JSP_DETAIL = "/detail.jsp";

	private static final String SEARCH_CATEGORY = "category";
	private static final String SEARCH_AUTHOR = "author";
	private static final String SEARCH_TIME = "doc";
	
	private static final String DB_STATUS_IN = "status in";
	private static final String DB_DOC = "status in";

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		try {
			LOGGER.info("Gọi article controller.");

			/*
			 * 1. Get list. 2. Get by category. 3. Get by author. 4. Get by
			 * time.
			 */
			int action = 1;

			// Get detail.
			if (req.getParameter(PARAMETER_ID) != null && !req.getParameter(PARAMETER_ID).isEmpty()) {
				String id = req.getParameter(PARAMETER_ID);
				Article article = ofy().load().type(Article.class).id(id).now();
				if (article == null) {
					resp.sendError(400);
					return;
				}
				StaticItem.addRecentView(article);

				req.setAttribute(ATTRIBUTE_ARTICLE, article);
				req.setAttribute(ATTRIBUTE_SERVER, req.getServerName());
				req.setAttribute(ATTRIBUTE_URL, req.getRequestURL().toString());
				req.getRequestDispatcher(JSP_DETAIL).forward(req, resp);
				return;
			}

			// Get list.
			StringBuilder searchValue = new StringBuilder();
			StringBuilder searchName = new StringBuilder();
			if (req.getParameter(PARAMETER_CATEGORY) != null && !req.getParameter(PARAMETER_CATEGORY).isEmpty()) {
				action = 2;
				searchValue.append(req.getParameter(PARAMETER_CATEGORY));
				searchName.append(SEARCH_CATEGORY);
			} else if (req.getParameter(PARAMETER_AUTHOR) != null && !req.getParameter(PARAMETER_AUTHOR).isEmpty()) {
				action = 3;
				searchValue.append(req.getParameter(PARAMETER_AUTHOR));
				searchName.append(SEARCH_AUTHOR);
			} else if (req.getParameter(PARAMETER_TIME) != null && !req.getParameter(PARAMETER_TIME).isEmpty()) {
				action = 4;
				searchValue.append(req.getParameter(PARAMETER_TIME));
				searchName.append(SEARCH_TIME);
			} else {
				action = 1;
			}

			int limit = 10;
			int page = 1;
			try {
				page = Integer.parseInt((String) req.getParameter(PARAMETER_PAGE));
			} catch (Exception e) {
				page = 1;
			}
			try {
				limit = Integer.parseInt((String) req.getParameter(PARAMETER_LIMIT));
			} catch (Exception e) {
				limit = 1;
			}

			List<Article> listArticle = ofy().load().type(Article.class).limit(limit + 1).offset((page - 1) * limit)
					.filter("status in", Arrays.asList(1, 2, 3)).filter(searchName.toString(), searchValue.toString()).order("-doc").list();

			boolean hasNextPage = listArticle.size() > limit;
			if (hasNextPage) {
				listArticle.remove(listArticle.size() - 1);
			}

			req.setAttribute("listArticle", listArticle);
			req.setAttribute("page", page);
			req.setAttribute("hasNextPage", hasNextPage);
			req.setAttribute("serverName", req.getServerName());
			req.setAttribute("requestUrl", req.getRequestURL().toString());

			req.getRequestDispatcher("/home.jsp").forward(req, resp);
		} catch (Exception e) {
			LOGGER.severe("Xảy ra lỗi trong quá trình xử lý home page.");
			e.printStackTrace(System.err);
			resp.sendError(500);
		}
	}
}
