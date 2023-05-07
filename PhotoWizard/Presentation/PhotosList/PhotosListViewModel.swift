//
//  PhotosListViewModel.swift
//  PhotoWizard
//
//  Created by Дмитрий Фетюхин on 04.05.2023.
//

import Foundation
import Combine

final class PhotosListViewModel: ObservableObject {
    
    private let photosService: PhotosService
    private let stateMachine: StateMachine
    private var stateCancellable: AnyCancellable?
    private var photosCancellable: AnyCancellable?
    private var page = 1
    
    @Published private(set) var state: StateMachine.State {
        willSet { leaveState(state) }
        didSet { enterState(state) }
    }
    
    @Published private(set) var photos = [Photo]()
    
    
    // MARK: - Init
    
    init(_ photosService: PhotosService,
         _ stateMachine: StateMachine) {
        self.photosService = photosService
        self.stateMachine = stateMachine
        self.state = stateMachine.state
        self.stateCancellable = stateMachine.statePublisher.sink { [weak self] state in
            self?.state = state
        }
    }
    
    // MARK: - Public
    
    public func startFetchingPhotos() {
        stateMachine.tryEvent(.startLoading)
        fetchPhotos()
    }
}

// MARK: - State changes

private extension PhotosListViewModel {

    func leaveState(_ state: StateMachine.State) {}
    
    func enterState(_ state: StateMachine.State) {}
}

// MARK: - Private

private extension PhotosListViewModel {
    
    func fetchPhotos() {
        photosCancellable = photosService.fetchPhotos(page: page).sink { [weak self] completion in
            switch completion {
            case .finished:
                break
                
            case let .failure(error):
                self?.stateMachine.tryEvent(.failure)
                print(error.localizedDescription)
            }
        } receiveValue: { [weak self] result in
            self?.photos.append(contentsOf: result)
            self?.stateMachine.tryEvent(.success)
            self?.page += 1
        }
    }
}
