package katy.bordercollie.helper;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

import katy.bordercollie.entity.Article;
import katy.bordercollie.entity.Category;
import katy.bordercollie.entity.Event;
import katy.bordercollie.entity.Page;

public class StaticItem {

	public static Map<String, Article> recents;
	public static List<Category> categories;
	public static List<Event> events;
	public static List<Page> pages;

	static {
		categories = ofy().load().type(Category.class).list();
	}

	public static void addRecentView(Article article) {
		if (recents == null) {
			recents = new TreeMap<String, Article>();
		}
		recents.put(article.getId(), article);
	}

	public static List<Article> getListRecents() {
		List<Article> listRecent = new ArrayList<Article>();
		if (recents != null && recents.entrySet().size() > 0) {
			for (Entry<String, Article> entry : recents.entrySet()) {
				listRecent.add(entry.getValue());
			}
			Collections.reverse(listRecent);
		}
		return listRecent;
	}
}
