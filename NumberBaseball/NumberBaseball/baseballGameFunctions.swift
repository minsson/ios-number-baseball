//
//  functions.swift
//  NumberBaseball
//
//  Created by Minseong Kang on 2022/04/13.
//

import Foundation

//func hasWinnerdecided() {
//
//}
//
//func decideWinner(strike: Int, LeftRound: Int) {
//    if strike == totalAnswerNumbers {
//        return
//    } else if LeftRound == 0 {
//        return
//    }
//}


func printMenu() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
}

func getUserChoiceOnMenu() -> String {
    guard let userChoice = readLine() else { return "" }
    return userChoice
}

func startGame(opportunityCount: Int) {
    printMenu()
    
    switch getUserChoiceOnMenu() {
    case "1":
        playGame(leftRound: opportunityCount - 1)
        startGame(opportunityCount: opportunityCount)
    case "2":
        return
    default:
        print("입력이 잘못되었습니다.")
        startGame(opportunityCount: opportunityCount)
    }
    
    return
}

func printInvalidInputMessage() {
    print("입력이 잘못되었습니다.")
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요")
    print("중복 숫자는 허용하지 않습니다.")
}

func getUserInput() -> [String] {
    print("입력 : ", terminator: "")
    guard let playerInput = readLine() else { return [""]}
    
    return convertStringToArray(from: playerInput)
}

func playGame(leftRound: Int) {
    let userInput: [String] = getUserInput()
    
    guard isValidInput(userInput) == true else {
        printInvalidInputMessage()
        playGame(leftRound: leftRound)
        return
    }
    
    let tryNumbers = convertToIntArray(from: userInput)
    let (strikeCount, ballCount) = countStrikeAndBall(in: tryNumbers, from: answerNumbers)
    
    printRoundResult(comparingWith: tryNumbers, score: (strikeCount, ballCount), leftOpportunity: leftRound)
    checkWinnerSeeing(strikeCount: strikeCount, leftRound: leftRound)

    if isFinished {
        print("\(winner) 승리...!")
        isFinished = false
        return
    } else {
        playGame(leftRound: leftRound - 1)
    }
}


func checkWinnerSeeing(strikeCount: Int, leftRound: Int) {
    if strikeCount == totalAnswerNumbers {
        isFinished = true
        winner = "사용자"
    } else if leftRound == 0{
        isFinished = true
        winner = "컴퓨터"
    }
}

func selectRandomNumbers(howMany maximum: Int) -> [Int] {
    var randomNumbers: [Int] = []
    var candidateNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    candidateNumbers.shuffle()
    
    while randomNumbers.count < maximum {
        randomNumbers.append(candidateNumbers.removeFirst())
    }
    
    return randomNumbers
}


func countStrikeAndBall(in tryNumbers: [Int], from answerNumbers: [Int]) -> (strike: Int, ball: Int) {
    var strikeCount: Int = 0
    var ballCount: Int = 0

    for index in 0..<answerNumbers.endIndex {
        guard answerNumbers[index] != tryNumbers[index] else {
            strikeCount += 1
            continue
        }
        guard answerNumbers.contains(tryNumbers[index]) else { continue }
            ballCount += 1
    }
    
    return (strikeCount, ballCount)
}


func printRoundResult(comparingWith numbers: [Int], score: (strike: Int, ball: Int), leftOpportunity: Int) {
    print("\(score.strike) 스트라이크, \(score.ball) 볼")
    print("남은 기회: \(leftOpportunity)")
}
