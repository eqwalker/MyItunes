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

func displayPrice(price: Double) -> String {
    let formatter = NumberFormatter()
    formatter.locale = Locale.current // Change this to another locale if you want to force a specific locale, otherwise this is redundant as the current locale is the default already
    formatter.numberStyle = .currency
    return formatter.string(from: price as NSNumber? ?? NSNumber(0.0)) ?? "0.0"
}

func displayDate(date: Date) -> String {
    // MMM d, yyyy
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
    dateFormatter.dateFormat = "MMM d, yyyy"
    return dateFormatter.string(from: date)
}

extension Track {
    static func toTrack(result: Result) -> Track {
        return Track(artistName: result.artistName ?? "Artist Name Unavailable" ,
                     trackName: result.trackName ?? "Track Name Unavailable",
                     releaseDate: displayDate(date: result.releaseDate ?? Date.distantPast),
                     primaryGenreName: result.primaryGenreName ?? "Genre Name Unavailable",
                     trackPrice: displayPrice(price: result.trackPrice ?? 0.0),
                     artworkUrl100: result.artworkUrl100 ?? "")
    }
}

