//
//  StateMachine.swift
//  Markov
//
//  Created by Benjamin on 05/10/2018.
//  Copyright © 2018 BenRx. All rights reserved.
//

import Foundation

class WeatherMachine {
    let transitionStateArray = [[0.9, 0.075, 0.025], // S->S, S->C, S->R
                                [0.15, 0.8, 0.05], // C->C, C->S, C->R
                                [0.25, 0.6, 0.15]] // R->R, R->S, R->C
    
    var firstNode: WeatherNode!
    var daysToCompute: Int!
    
    init (numberOfDays: Int) {
        self.daysToCompute = numberOfDays
        self.firstNode = WeatherNode(state: .sunny, transitionProbability: 0.9, maxDeepLevel: self.daysToCompute, curDeepLevel: 0)
        self.simulate()
    }
    
    private func simulate() {
        let sunnyProb = self.computeProb(stateToComp: .sunny, curNode: self.firstNode, curDeep: 0, curProb: 1)
        print("The probability of having sunshine in \(self.daysToCompute!) days is \(sunnyProb * 100)%")
        
        let cloudyProb = self.computeProb(stateToComp: .cloudy, curNode: self.firstNode, curDeep: 0, curProb: 1)
        print("The probability of having clouds in \(self.daysToCompute!) days is \(cloudyProb * 100)%")
        
        let rainyProb = self.computeProb(stateToComp: .rainy, curNode: self.firstNode, curDeep: 0, curProb: 1)
        print("The probability of having rain in \(self.daysToCompute!) days is \(rainyProb * 100)%")
    }
    
    private func computeProb(stateToComp: WeatherNode.State, curNode: WeatherNode, curDeep: Int, curProb: Double) -> Double {
        let computedProb = curDeep == 0 ? 1 : curProb * curNode.transitionP
        if curDeep == self.daysToCompute {
            return curNode.state == stateToComp ? computedProb : 0
        }
        
        var sumProb = 0.0
        for son in curNode.next {
            sumProb += self.computeProb(stateToComp: stateToComp, curNode: son, curDeep: curDeep + 1, curProb: computedProb)
        }
        return sumProb
    }
    
    private func displayNodeSons(curNode: WeatherNode, deepLvl: Int) {
        print("DeepLvl : \(deepLvl), CurNode state : \(curNode.state!)")
        
        if (curNode.next.count == 0) {
            print("This Node has no child")
        } else {
            for son in curNode.next {
                print("Proba for next state \(son.state!) is \(son.transitionP!)")
            }
        }
        print()
        for son in curNode.next {
            self.displayNodeSons(curNode: son, deepLvl: deepLvl + 1)
        }
    }
}
