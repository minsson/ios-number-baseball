//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let totalAnswerNumbers = 3
let answerNumbers = selectRandomNumbers(howMany: 3)


// 이 코드 문제 없다고 나옴. 검사 기준, 특히 요소 사이에 공백 있는 거 맞는지
// let characters = ["1", " ", "2", " ", "3"]
// print(isValidInput(characters))


startGame(opportunityCount: 9)
