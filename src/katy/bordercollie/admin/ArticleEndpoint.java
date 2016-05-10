package katy.bordercollie.admin;

import static com.googlecode.objectify.ObjectifyService.ofy;
import java.io.IOException;
import java.math.BigInteger;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.UserServiceFactory;
import com.google.appengine.labs.repackaged.org.json.JSONException;

import design.java.rest.RESTFactory;
import design.java.rest.RESTGeneralError;
import design.java.rest.RESTGeneralSuccess;
import design.java.rest.entity.RESTDocumentSingle;
import katy.bordercollie.entity.Article;
import katy.bordercollie.helper.BaseX;

@SuppressWarnings("serial")
public class ArticleEndpoint extends HttpServlet {
	private static final Logger LOGGER = Logger.getLogger(ArticleEndpoint.class.getSimpleName());

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LOGGER.info(
				"Gọi article endpoint, method get." + UserServiceFactory.getUserService().getCurrentUser().getEmail());
		Article art = new Article();
		art.setId(new BaseX(BaseX.DICTIONARY_MINE).encode(new BigInteger(String.valueOf(System.nanoTime()))));
		art.setTitle("Test Article.");
		RESTFactory.make(RESTGeneralSuccess.OK).putData(art).doResponse(resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			RESTDocumentSingle document = RESTDocumentSingle.getInstanceFromRequest(req);
			Article article = document.getData().getInstance(Article.class);
			ofy().save().entity(article).now();
			RESTFactory.make(RESTGeneralSuccess.CREATED).putData(article).doResponse(resp);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace(System.err);
			RESTFactory.make(RESTGeneralError.BAD_REQUEST).doResponse(resp);
		}
	}
}
