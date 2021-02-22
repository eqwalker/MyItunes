// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

public struct MyiTunesResponse: Codable {
    public var resultCount: Int?
    public var results: [Result]?

    public init(resultCount: Int?, results: [Result]?) {
        self.resultCount = resultCount
        self.results = results
    }
}

// MARK: - Result
public struct Result: Codable {
    public var wrapperType: String?
    public var kind: String?
    public var collectionID, trackID: Int?
    public var artistName: String?
    public var collectionName, trackName, collectionCensoredName, trackCensoredName: String?
    public var collectionArtistID: Int?
    public var collectionArtistViewURL, collectionViewURL, trackViewURL: String?
    public var previewURL: String?
    public var artworkUrl30, artworkUrl60, artworkUrl100: String?
    public var collectionPrice, trackPrice, trackRentalPrice, collectionHDPrice: Double?
    public var trackHDPrice, trackHDRentalPrice: Double?
    public var releaseDate: Date?
    public var collectionExplicitness, trackExplicitness: String?
    public var discCount, discNumber, trackCount, trackNumber: Int?
    public var trackTimeMillis: Int?
    public var country: String?
    public var currency: String?
    public var primaryGenreName: String?
    public var contentAdvisoryRating: String?
    public var longDescription: String?
    public var hasITunesExtras: Bool?
    public var artistID: Int?
    public var artistViewURL: String?
    public var shortDescription, copyright, resultDescription: String?

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case collectionArtistID = "collectionArtistId"
        case collectionArtistViewURL = "collectionArtistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, trackRentalPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case trackHDRentalPrice = "trackHdRentalPrice"
        case releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, longDescription, hasITunesExtras
        case artistID = "artistId"
        case artistViewURL = "artistViewUrl"
        case shortDescription, copyright
        case resultDescription = "description"
    }

    public init(wrapperType: String?, kind: String?, collectionID: Int?, trackID: Int?, artistName: String?, collectionName: String?, trackName: String?, collectionCensoredName: String?, trackCensoredName: String?, collectionArtistID: Int?, collectionArtistViewURL: String?, collectionViewURL: String?, trackViewURL: String?, previewURL: String?, artworkUrl30: String?, artworkUrl60: String?, artworkUrl100: String?, collectionPrice: Double?, trackPrice: Double?, trackRentalPrice: Double?, collectionHDPrice: Double?, trackHDPrice: Double?, trackHDRentalPrice: Double?, releaseDate: Date?, collectionExplicitness: String?, trackExplicitness: String?, discCount: Int?, discNumber: Int?, trackCount: Int?, trackNumber: Int?, trackTimeMillis: Int?, country: String?, currency: String?, primaryGenreName: String?, contentAdvisoryRating: String?, longDescription: String?, hasITunesExtras: Bool?, artistID: Int?, artistViewURL: String?, shortDescription: String?, copyright: String?, resultDescription: String?) {
        self.wrapperType = wrapperType
        self.kind = kind
        self.collectionID = collectionID
        self.trackID = trackID
        self.artistName = artistName
        self.collectionName = collectionName
        self.trackName = trackName
        self.collectionCensoredName = collectionCensoredName
        self.trackCensoredName = trackCensoredName
        self.collectionArtistID = collectionArtistID
        self.collectionArtistViewURL = collectionArtistViewURL
        self.collectionViewURL = collectionViewURL
        self.trackViewURL = trackViewURL
        self.previewURL = previewURL
        self.artworkUrl30 = artworkUrl30
        self.artworkUrl60 = artworkUrl60
        self.artworkUrl100 = artworkUrl100
        self.collectionPrice = collectionPrice
        self.trackPrice = trackPrice
        self.trackRentalPrice = trackRentalPrice
        self.collectionHDPrice = collectionHDPrice
        self.trackHDPrice = trackHDPrice
        self.trackHDRentalPrice = trackHDRentalPrice
        self.releaseDate = releaseDate
        self.collectionExplicitness = collectionExplicitness
        self.trackExplicitness = trackExplicitness
        self.discCount = discCount
        self.discNumber = discNumber
        self.trackCount = trackCount
        self.trackNumber = trackNumber
        self.trackTimeMillis = trackTimeMillis
        self.country = country
        self.currency = currency
        self.primaryGenreName = primaryGenreName
        self.contentAdvisoryRating = contentAdvisoryRating
        self.longDescription = longDescription
        self.hasITunesExtras = hasITunesExtras
        self.artistID = artistID
        self.artistViewURL = artistViewURL
        self.shortDescription = shortDescription
        self.copyright = copyright
        self.resultDescription = resultDescription
    }
}
