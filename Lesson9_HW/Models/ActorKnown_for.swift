import Foundation

struct Known_for : Codable {
	let adult : Bool?
	let backdropPath : String?
	let genre_ids : [Int]?
	let id : Int?
	let media_type : String?
	let original_language : String?
	let original_title : String?
	let overview : String?
	let poster_path : String?
	let release_date : String?
	let title : String?
	let video : Bool?
	let vote_average : Double?
	let vote_count : Int?

	enum CodingKeys: String, CodingKey {

		case adult = "adult"
		case backdropPath = "backdrop_path"
		case genre_ids = "genre_ids"
		case id = "id"
		case media_type = "media_type"
		case original_language = "original_language"
		case original_title = "original_title"
		case overview = "overview"
		case poster_path = "poster_path"
		case release_date = "release_date"
		case title = "title"
		case video = "video"
		case vote_average = "vote_average"
		case vote_count = "vote_count"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
		backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)
		genre_ids = try values.decodeIfPresent([Int].self, forKey: .genre_ids)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		media_type = try values.decodeIfPresent(String.self, forKey: .media_type)
		original_language = try values.decodeIfPresent(String.self, forKey: .original_language)
		original_title = try values.decodeIfPresent(String.self, forKey: .original_title)
		overview = try values.decodeIfPresent(String.self, forKey: .overview)
		poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path)
		release_date = try values.decodeIfPresent(String.self, forKey: .release_date)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		video = try values.decodeIfPresent(Bool.self, forKey: .video)
		vote_average = try values.decodeIfPresent(Double.self, forKey: .vote_average)
		vote_count = try values.decodeIfPresent(Int.self, forKey: .vote_count)
	}

}
