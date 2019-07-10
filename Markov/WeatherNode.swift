//
//  WeatherNode.swift
//  Markov
//
//  Created by Benjamin on 06/10/2018.
//  Copyright © 2018 BenRx. All rights reserved.
//

import Foundation

class WeatherNode {
    enum State {
        case sunny
        case cloudy
        case rainy
    }
    
    let currentDeepLevel: Int!
    let state: State!
    let transitionP: Double!
    var next = [WeatherNode]()
    
    init(state: State, transitionProbability: Double, maxDeepLevel: Int, curDeepLevel: Int) {
        self.currentDeepLevel = curDeepLevel
        self.state = state
        self.transitionP = transitionProbability
        
        if (curDeepLevel < maxDeepLevel) {
            self.createSonsNodes(state: state, maxDeepLevel: maxDeepLevel, curDeepLevel: curDeepLevel)
        }
    }
    
    private func createSonsNodes(state: WeatherNode.State, maxDeepLevel: Int, curDeepLevel: Int) {
        switch state {
        case .sunny:
            self.next.append(WeatherNode(state: .cloudy, transitionProbability: 0.075, maxDeepLevel: maxDeepLevel, curDeepLevel: curDeepLevel + 1))
            self.next.append(WeatherNode(state: .rainy, transitionProbability: 0.025, maxDeepLevel: maxDeepLevel, curDeepLevel: curDeepLevel + 1))
            self.next.append(WeatherNode(state: .sunny, transitionProbability: 0.9, maxDeepLevel: maxDeepLevel, curDeepLevel: curDeepLevel + 1))
        case .cloudy:
            self.next.append(WeatherNode(state: .sunny, transitionProbability: 0.8, maxDeepLevel: maxDeepLevel, curDeepLevel: curDeepLevel + 1))
            self.next.append(WeatherNode(state: .rainy, transitionProbability: 0.05, maxDeepLevel: maxDeepLevel, curDeepLevel: curDeepLevel + 1))
            self.next.append(WeatherNode(state: .cloudy, transitionProbability: 0.15, maxDeepLevel: maxDeepLevel, curDeepLevel: curDeepLevel + 1))
        case .rainy:
            self.next.append(WeatherNode(state: .sunny, transitionProbability: 0.6, maxDeepLevel: maxDeepLevel, curDeepLevel: curDeepLevel + 1))
            self.next.append(WeatherNode(state: .cloudy, transitionProbability: 0.15, maxDeepLevel: maxDeepLevel, curDeepLevel: curDeepLevel + 1))
            self.next.append(WeatherNode(state: .rainy, transitionProbability: 0.25, maxDeepLevel: maxDeepLevel, curDeepLevel: curDeepLevel + 1))
        }
    }
    
}
