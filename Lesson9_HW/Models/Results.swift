import Foundation

struct Movie : Codable {
	let adult : Bool?
	let backdropPath : String?
	let genreIds : [Int]?
	let id : Int?
	let mediaType : String?
	let title : String?
    let originalName: String?
	let originalLanguage : String?
	let originalTitle : String?
	let overview : String?
	let popularity : Double?
	let posterPath : String?
	let releaseDate : String?
    let firstAirDate : String?
	let video : Bool?
	let voteAverage : Double?
	let voteCount : Int?

	enum CodingKeys: String, CodingKey {

		case adult = "adult"
		case backdropPath = "backdrop_path"
		case genreIds = "genre_ids"
		case id = "id"
		case mediaType = "media_type"
		case title = "title"
        case originalName = "original_name"
		case originalLanguage = "original_language"
		case originalTitle = "original_title"
		case overview = "overview"
		case popularity = "popularity"
		case posterPath = "poster_path"
		case releaseDate = "release_date"
        case firstAirDate = "first_air_date"
		case video = "video"
		case voteAverage = "vote_average"
		case voteCount = "vote_count"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
		backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)
		genreIds = try values.decodeIfPresent([Int].self, forKey: .genreIds)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		mediaType = try values.decodeIfPresent(String.self, forKey: .mediaType)
		title = try values.decodeIfPresent(String.self, forKey: .title)
        originalName = try values.decodeIfPresent(String.self, forKey: .originalName)
		originalLanguage = try values.decodeIfPresent(String.self, forKey: .originalLanguage)
		originalTitle = try values.decodeIfPresent(String.self, forKey: .originalTitle)
		overview = try values.decodeIfPresent(String.self, forKey: .overview)
		popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
		posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
		releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        firstAirDate = try values.decodeIfPresent(String.self, forKey: .firstAirDate)
		video = try values.decodeIfPresent(Bool.self, forKey: .video)
		voteAverage = try values.decodeIfPresent(Double.self, forKey: .voteAverage)
		voteCount = try values.decodeIfPresent(Int.self, forKey: .voteCount)
	}
}

