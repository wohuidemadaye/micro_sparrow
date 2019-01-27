class ExisttokenEntity {
	List<Data> data;

	ExisttokenEntity({this.data});

	ExisttokenEntity.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null) {
			data = new List<Data>();
			json['data'].forEach((v) { data.add(new Data.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class Data {
	num id;
	String type;
	num userId;
	String description;
	String applicationId;
	String lastUsedAt;
	String createdAt;
	String updatedAt;
	num spaceId;
	String application;
	String sSerializer;

	Data({this.id, this.type, this.userId, this.description, this.applicationId, this.lastUsedAt, this.createdAt, this.updatedAt, this.spaceId, this.application, this.sSerializer});

	Data.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		type = json['type'];
		userId = json['user_id'];
		description = json['description'];
		applicationId = json['application_id'];
		lastUsedAt = json['last_used_at'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		spaceId = json['space_id'];
		application = json['application'];
		sSerializer = json['_serializer'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['type'] = this.type;
		data['user_id'] = this.userId;
		data['description'] = this.description;
		data['application_id'] = this.applicationId;
		data['last_used_at'] = this.lastUsedAt;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		data['space_id'] = this.spaceId;
		data['application'] = this.application;
		data['_serializer'] = this.sSerializer;
		return data;
	}
}
