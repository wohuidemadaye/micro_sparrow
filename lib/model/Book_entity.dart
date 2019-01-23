class BookEntity {
	Book book;
	Search search;

	BookEntity({this.book,this.search});

	BookEntity.fromJson(Map<String, dynamic> json) {
		book = json['book'] != null ? new Book.fromJson(json['book']) : null;
		search = json['search'] != null ? new Search.fromJson(json['search']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.book != null) {
      data['book'] = this.book.toJson();
    }
    if(this.search !=null){
			data['search'] = this.search.toJson();
		}
		return data;
	}
}

class Book {
	String contentUpdatedAt;
	bool enableComment;
	bool enableExport;
	bool enableVisitorWatermark;
	String copyrightWatermark;
	bool enableSearchEngine;
	bool enableWebhook;
	bool enableTrash;
	num id;
	num spaceId;
	String type;
	String slug;
	String name;
	String description;
	List<Toc> toc;
	String tocYml;
	String body;
	num userId;
	num creatorId;
	num public;
	num excellent;
	num menuType;
	num itemsCount;
	num likesCount;
	num watchesCount;
	num contentUpdatedAtMs;
	String deletedSlug;
	String createdAt;
	String updatedAt;
	String pinnedAt;
	String archivedAt;
	String deletedAt;
	String joinToken;
	num tocVersion;

	Book({this.contentUpdatedAt, this.enableComment, this.enableExport, this.enableVisitorWatermark, this.copyrightWatermark, this.enableSearchEngine, this.enableWebhook, this.enableTrash, this.id, this.spaceId, this.type, this.slug, this.name, this.description, this.toc, this.tocYml, this.body, this.userId, this.creatorId, this.public, this.excellent, this.menuType, this.itemsCount, this.likesCount, this.watchesCount, this.contentUpdatedAtMs, this.deletedSlug, this.createdAt, this.updatedAt, this.pinnedAt, this.archivedAt, this.deletedAt, this.joinToken, this.tocVersion});

	Book.fromJson(Map<String, dynamic> json) {
		contentUpdatedAt = json['content_updated_at'];
		enableComment = json['enable_comment'];
		enableExport = json['enable_export'];
		enableVisitorWatermark = json['enable_visitor_watermark'];
		copyrightWatermark = json['copyright_watermark'];
		enableSearchEngine = json['enable_search_engine'];
		enableWebhook = json['enable_webhook'];
		enableTrash = json['enable_trash'];
		id = json['id'];
		spaceId = json['space_id'];
		type = json['type'];
		slug = json['slug'];
		name = json['name'];
		description = json['description'];
		if (json['toc'] != null) {
			toc = new List<Toc>();
			json['toc'].forEach((v) { toc.add(new Toc.fromJson(v)); });
		}
		tocYml = json['toc_yml'];
		body = json['body'];
		userId = json['user_id'];
		creatorId = json['creator_id'];
		public = json['public'];
		excellent = json['excellent'];
		menuType = json['menu_type'];
		itemsCount = json['items_count'];
		likesCount = json['likes_count'];
		watchesCount = json['watches_count'];
		contentUpdatedAtMs = json['content_updated_at_ms'];
		deletedSlug = json['deleted_slug'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		pinnedAt = json['pinned_at'];
		archivedAt = json['archived_at'];
		deletedAt = json['deleted_at'];
		joinToken = json['join_token'];
		tocVersion = json['toc_version'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['content_updated_at'] = this.contentUpdatedAt;
		data['enable_comment'] = this.enableComment;
		data['enable_export'] = this.enableExport;
		data['enable_visitor_watermark'] = this.enableVisitorWatermark;
		data['copyright_watermark'] = this.copyrightWatermark;
		data['enable_search_engine'] = this.enableSearchEngine;
		data['enable_webhook'] = this.enableWebhook;
		data['enable_trash'] = this.enableTrash;
		data['id'] = this.id;
		data['space_id'] = this.spaceId;
		data['type'] = this.type;
		data['slug'] = this.slug;
		data['name'] = this.name;
		data['description'] = this.description;
		if (this.toc != null) {
      data['toc'] = this.toc.map((v) => v.toJson()).toList();
    }
		data['toc_yml'] = this.tocYml;
		data['body'] = this.body;
		data['user_id'] = this.userId;
		data['creator_id'] = this.creatorId;
		data['public'] = this.public;
		data['excellent'] = this.excellent;
		data['menu_type'] = this.menuType;
		data['items_count'] = this.itemsCount;
		data['likes_count'] = this.likesCount;
		data['watches_count'] = this.watchesCount;
		data['content_updated_at_ms'] = this.contentUpdatedAtMs;
		data['deleted_slug'] = this.deletedSlug;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		data['pinned_at'] = this.pinnedAt;
		data['archived_at'] = this.archivedAt;
		data['deleted_at'] = this.deletedAt;
		data['join_token'] = this.joinToken;
		data['toc_version'] = this.tocVersion;
		return data;
	}
}

class Toc {
	String type;
	String title;
	num level;
	String url;

	Toc({this.type, this.title, this.level,this.url});

	Toc.fromJson(Map<String, dynamic> json) {
		type = json['type'];
		title = json['title'];
		level = json['level'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['type'] = this.type;
		data['title'] = this.title;
		data['level'] = this.level;
		return data;
	}
}

class Search{
	String scope;

	Search({this.scope});


	Search.fromJson(Map<String, dynamic> json){
		scope = json['scope'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['scope'] = this.scope;
		return data;
	}


}
