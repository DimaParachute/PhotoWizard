//
//  StateMachine.swift
//  PhotoWizard
//
//  Created by Дмитрий Фетюхин on 04.05.2023.
//

import Foundation
import Combine

final class StateMachine {
    
    enum State {
        
        case start, loading, results, error
    }
    
    enum Event {
        
        case startLoading, success, failure
    }
    
    private(set) var state: State {
        didSet { stateSubject.send(self.state) }
    }
    
    private let stateSubject: PassthroughSubject<State, Never>
    
    let statePublisher: AnyPublisher<State, Never>
    
    init(state: State) {
        self.state = state
        self.stateSubject = PassthroughSubject<State, Never>()
        self.statePublisher = self.stateSubject.eraseToAnyPublisher()
    }
}

extension StateMachine {
    
    func tryEvent(_ event: Event) {
        if let state = nextState(for: event) {
            self.state = state
        }
    }
}

extension StateMachine {
    
    private func nextState(for event: Event) -> State? {
        switch state {
            
        case .start:
            switch event {
                
            case .startLoading:
                return .loading
                
            case .success:
                return nil
                
            case .failure:
                return nil
        }
            
        case .loading:
            switch event {
                
            case .startLoading:
                return nil
                
            case .success:
                return .results
                
            case .failure:
                return .error
        }
            
        case .error:
            return nil
            
        case .results:
            switch event {
                
            case .startLoading:
                return .results
                
            case .success:
                return .results
                
            case .failure:
                return .error
            }
        }
    }
}
