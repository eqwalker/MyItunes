//
//  TrackView.swift
//  MyiTunes
//
//  Created by Eric Walker on 2/21/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct TracksView: View {
    @ObservedObject var tracksViewModel: TracksViewModel
    var body: some View {
        List {
            ForEach(tracksViewModel.tracks, id: \.self) { track in
                TrackCellView(track: track)
            }
        }
    }
}

struct TrackCellView: View {
    let track: Track
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(track.artistName)
                .font(.headline)
            WebImage(url: URL(string: track.artworkUrl100))
                // Supports options and context, like `.delayPlaceholder` to show placeholder only when error
                .onSuccess { image, data, cacheType in
                    // Success
                    // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
                }
                .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                .placeholder(Image(systemName: "photo")) // Placeholder Image
                // Supports ViewBuilder as well
                .placeholder {
                    Rectangle().foregroundColor(.gray)
                }
                .indicator(.activity) // Activity Indicator
                .transition(.fade(duration: 0.5)) // Fade Transition with duration
                .scaledToFit()
            HStack {
                Text(track.trackName)
                Spacer()
                Text(track.trackPrice)
            }
            Text(track.releaseDate)
            Text(track.primaryGenreName)
        }
        .padding()
        .shadow(radius: 5)
        .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
                )
    }
}

struct TrackView_Previews: PreviewProvider {
    static var previews: some View {
        TrackCellView(track: Track.mock)
            .previewLayout(.sizeThatFits)
        
        TracksView(tracksViewModel: TracksViewModel(tracks: [Track.mock, Track.mock]))
            .previewLayout(.sizeThatFits)
    }
}
