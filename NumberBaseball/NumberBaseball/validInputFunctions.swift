//
//  validInputFunctions.swift
//  NumberBaseball
//
//  Created by Minseong Kang on 2022/04/16.
//

import Foundation

func isWhiteSpace(_ char: String) -> Bool {
    guard char == " " else { return false }
    return true
}

func isOdd(_ number: Int) -> Bool {
    guard number % 2 == 1 else { return false }
    return true
}

func areWhiteSpacesValid(array: [String]) -> Bool { // trim 필요함
    for index in stride(from: 1 , to: array.endIndex, by: 2) {
            guard isOdd(index) && isWhiteSpace(array[index]) else { return false }
            continue
        }
        return true
}
// <끝>

func deleteWhiteSpaces(in array: [String]) -> [String] {
    var result: [String] = []
    for char in array {
        if char != " " {
            result.append(char)
        }
    }
    return result
}

func areElementsInteger(in array: [String]) -> Bool {
    for element in array {
        guard element != " " else { continue }
        guard Int(element) != nil else { return false }
    }
    return true
}

func areThereDuplicatedNumbers(in array: [Int]) -> Bool {
    guard array.count == Set(array).count else { return false }
    return true
}


func isNumbersQuantity(in array: [Int], theSameAs gameNumbersQuantity: Int) -> Bool {
    guard array.count == gameNumbersQuantity else { return false }
    return true
}

func isValidInput(_ userInput: [String]) -> Bool {
    guard areElementsInteger(in: userInput) // 모두 숫자로 이루어져있는가?
            && areWhiteSpacesValid(array: userInput) else { return false }  //  숫자 사이의 띄어쓰기가 한 칸씩?
    
    let numbers = convertToIntArray(from: userInput)

    guard areThereDuplicatedNumbers(in: numbers) else { return false } // 중복되는 거 있는지 검사
    guard isNumbersQuantity(in: numbers, theSameAs: totalAnswerNumbers) else { return false } // 개수 맞는지?

    return true
}


func convertToIntArray(from stringArray: [String]) -> [Int] {
    var intArray: [Int] = []
    
    for element in stringArray {
        guard let number = Int(element) else { continue }
        intArray.append(number)
    }
    
    return intArray
}

func convertStringToArray(from string: String) -> [String] {
    return string.map{ String($0) }
}
