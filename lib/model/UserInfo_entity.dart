class UserinfoEntity {
	Data data;

	UserinfoEntity({this.data});

	UserinfoEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new Data.fromJson(json['data']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		return data;
	}

	void initData(){
		this.data = new Data(
			id: 0,
			type: "",
			name: "",
			description: "",
			avatarUrl: "https://cdn.nlark.com/yuque/0/2018/png/219264/1543920414824-"
					"f13df41e-223f-42c0-87f2-811d21ef60c3.png?x-oss-process=image/resize,m_fill,w_48,h_48/format,png"
		);
	}
}

class Data {
	num id;
	String type;
	String login;
	String name;
	String description;
	String avatarUrl;
	String createdAt;
	String updatedAt;

	Data({this.id, this.type, this.login, this.name, this.description, this.avatarUrl, this.createdAt, this.updatedAt});

	Data.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		type = json['type'];
		login = json['login'];
		name = json['name'];
		description = json['description'];
		avatarUrl = json['avatar_url'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['type'] = this.type;
		data['login'] = this.login;
		data['name'] = this.name;
		data['description'] = this.description;
		data['avatar_url'] = this.avatarUrl;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		return data;
	}
}
