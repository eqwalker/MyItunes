//
//  Track.swift
//  MyiTunes
//
//  Created by Eric Walker on 2/21/21.
//

import Foundation

extension Track: Hashable {
    
}
struct Track {
    let artistName: String
    let trackName: String
    let releaseDate: String
    let primaryGenreName: String
    let trackPrice: String
    let artworkUrl100: String
}

extension Track {
    static var mock: Track {
        return Track(artistName: "Star Trek: The Original Series (Remastered)",
                     trackName: "The Menagerie, Part II",
                     releaseDate: "1966-11-24T08:00:00Z",
                     primaryGenreName: "Sci-Fi & Fantasy",
                     trackPrice: "1.99", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Video/v4/87/9e/93/879e9366-d81e-ae55-20ef-6563901933df/source/100x100bb.jpg")
    }
}

extension Track {
    static func toTrack(result: Result) -> Track {
        return Track(artistName: result.artistName ?? "" ,
                     trackName: result.trackName ?? "",
                     releaseDate: result.releaseDate ?? "",
                     primaryGenreName: result.primaryGenreName ?? "",
                     trackPrice: result.trackPrice ?? "",
                     artworkUrl100: result.artworkUrl100 ?? "")
    }
}

