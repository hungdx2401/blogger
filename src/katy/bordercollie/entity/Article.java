package katy.bordercollie.entity;

import java.util.ArrayList;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.annotation.Unindex;

@Entity
public class Article {
	@Id
	private String id;
	@Unindex
	private String alias;
	@Unindex
	private String title;
	@Index
	private String categoryId;
	@Index
	private String eventId;
	@Unindex
	private String description;
	@Unindex
	private ArrayList<String> photos;
	@Unindex
	private String content;
	@Unindex
	private ArrayList<String> tags;
	@Index
	private long doc;
	@Unindex
	private long updated;
	@Index
	private int status;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
