package katy.bordercollie.controller;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.googlecode.objectify.cmd.Query;

import katy.bordercollie.entity.Article;
import katy.bordercollie.entity.Category;
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

	public static final String ATTRIBUTE_ARTICLE = "article";
	public static final String ATTRIBUTE_LIST_ARTICLE = "listArticle";
	public static final String ATTRIBUTE_SERVER = "server";
	public static final String ATTRIBUTE_URL = "url";
	public static final String ATTRIBUTE_PAGE = "currentPage";
	public static final String ATTRIBUTE_LIMIT = "limit";
	public static final String ATTRIBUTE_HAS_NEXT = "hasNext";
	public static final String ATTRIBUTE_TITLE = "title";

	private static final String JSP_DETAIL = "/detail.jsp";
	private static final String JSP_LIST_ARTICLE = "/list-article.jsp";
	private static final String JSP_SEARCH = "/search.jsp";

	private static final String DB_CATEGORY_ID = "categoryId";
	private static final String DB_CREATED_BY = "createdBy";
	private static final String DB_DOC = "doc";
	private static final String DB_STATUS_IN = "status in";
	private static final String DB_ORDER_BY = "-doc";

	private static final int DEFAULT_LIMIT = 10;
	private static final int DEFAULT_PAGE = 1;

	private static final List<Integer> ACCEPT_STATUS = Arrays.asList(1, 2, 3);

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		try {
			LOGGER.info("Gọi article controller.");

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
			String view = JSP_LIST_ARTICLE;
			String title = "";
			Query<Article> query = ofy().load().type(Article.class).filter(DB_STATUS_IN, ACCEPT_STATUS);
			if (req.getParameter(PARAMETER_CATEGORY) != null && !req.getParameter(PARAMETER_CATEGORY).isEmpty()) {
				Category category = ofy().load().type(Category.class).id(req.getParameter(PARAMETER_CATEGORY)).now();
				if (category == null) {
					resp.sendError(404);
				}
				query = query.filter(DB_CATEGORY_ID, req.getParameter(PARAMETER_CATEGORY));
				view = JSP_SEARCH;
				title += "Danh mục: ";
				title += category.getTitle();
			} else if (req.getParameter(PARAMETER_AUTHOR) != null && !req.getParameter(PARAMETER_AUTHOR).isEmpty()) {
				query = query.filter(DB_CREATED_BY, req.getParameter(PARAMETER_AUTHOR));
				view = JSP_SEARCH;
				title += "Tác giả: ";
				title += req.getParameter(PARAMETER_AUTHOR);
			} else if (req.getParameter(PARAMETER_TIME) != null && !req.getParameter(PARAMETER_TIME).isEmpty()) {
				query = query.filter(DB_DOC, req.getParameter(req.getParameter(PARAMETER_TIME)));
				view = JSP_SEARCH;
			}

			int limit = DEFAULT_LIMIT;
			int page = DEFAULT_PAGE;
			try {
				page = Integer.parseInt((String) req.getParameter(PARAMETER_PAGE));
			} catch (Exception e) {
				page = DEFAULT_PAGE;
			}
			try {
				limit = Integer.parseInt((String) req.getParameter(PARAMETER_LIMIT));
			} catch (Exception e) {
				limit = DEFAULT_LIMIT;
			}
			query = query.limit(limit + 1).offset((page - 1) * limit).order(DB_ORDER_BY);
			LOGGER.info("Query: " + query.toString());
			List<Article> listArticle = query.list();

			boolean hasNext = listArticle.size() > limit;
			if (hasNext) {
				listArticle.remove(listArticle.size() - 1);
			}

			req.setAttribute(ATTRIBUTE_LIST_ARTICLE, listArticle);
			req.setAttribute(ATTRIBUTE_PAGE, page);
			req.setAttribute(ATTRIBUTE_LIMIT, limit);
			req.setAttribute(ATTRIBUTE_HAS_NEXT, hasNext);
			req.setAttribute(ATTRIBUTE_SERVER, req.getServerName());
			req.setAttribute(ATTRIBUTE_URL, req.getRequestURL().toString());
			req.setAttribute(ATTRIBUTE_TITLE, title);
			req.getRequestDispatcher(view).forward(req, resp);
		} catch (Exception e) {
			LOGGER.severe("Xảy ra lỗi trong quá trình xử lý home page.");
			e.printStackTrace(System.err);
			resp.sendError(500);
		}
	}
}
