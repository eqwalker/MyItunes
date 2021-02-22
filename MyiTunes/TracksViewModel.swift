//
//  TracksViewModel.swift
//  MyiTunes
//
//  Created by Eric Walker on 2/22/21.
//

import Combine
import Foundation

enum TracksAction {
    case clear
    case fetch(String)
}

class TracksViewModel: ObservableObject {
    private var cancellableSet: Set<AnyCancellable> = []
    private let tracksRepository: TracksRepository

    @Published private(set) var errorMessage = ""
    @Published private(set) var tracks: [Track] = []
    @Published private(set) var noResults = false
    @Published private(set) var searching = false
    
    public init(tracksRepository: TracksRepository) {
        self.tracksRepository = tracksRepository
    }

    func send(_ action: TracksAction) {
        switch action {
        case let .fetch(searchTerm):
            searching = true
            cancellableSet.removeAll()
            tracksRepository.tracks(searchTerm: searchTerm)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] (completion) in
                    guard let self = self else { return }
                    switch completion {
                    case .finished:
                        self.errorMessage = ""
                    case let .failure(error):
                        self.errorMessage = error.localizedDescription
                    }
                    self.searching = false
                } receiveValue: { [weak self] (tracks) in
                    guard let self = self else { return }
                    self.tracks = tracks
                    self.noResults = tracks.isEmpty
                    self.searching = false
                }
                .store(in: &cancellableSet)
        case .clear:
            tracks = []
        }
    }
}
