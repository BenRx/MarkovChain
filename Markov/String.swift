//
//  String.swift
//  Markov
//
//  Created by Benjamin on 05/10/2018.
//  Copyright © 2018 BenRx. All rights reserved.
//

import Foundation

extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}
