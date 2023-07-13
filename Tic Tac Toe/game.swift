//
//  game.swift
//  Tic Tac Toe
//
//  Created by Lo Hoa Tsun Colin on 2/7/2022.
//  Copyright © 2022 Lo Hoa Tsun Colin. All rights reserved.
//

import Foundation

let boardDashPrint = ("-----------")

// 0: Empty
// 1: X
// 2: O

func getBoardCell (_ cell: Int) -> String?{
    switch cell {
    case 0:
        return nil
    case 1:
        return "X"
    case 2:
        return "O"
    default:
        return "error"
    }
}

func initGameBoard(gameBoard: inout [Int]){
    for _ in 0..<9{
        gameBoard.append(0)
    }
    displayBoard(gameBoard: gameBoard)
}


func displayBoard(gameBoard:[Int]) {
    print(boardDashPrint)
    for i in 0..<3{
        for j in 0..<3{
            let cell: String = getBoardCell(gameBoard[i * 3 + j]) ?? String(i * 3 + j + 1)
                
            print(" \(cell) ", terminator: "")
           
            if j < 2{
                print("|", terminator: "")
            }
        }
        print("\n\(boardDashPrint)")
    }
}

func getPlayerInput(curPlayer: Int){
    print("Current: Player \(curPlayer), place \(getBoardCell(curPlayer)!)")
    print("Please input from 1-9: ", terminator: "")
    var input: Int = Int(readLine()!)!
    while(!isValid(input: input)){
         input = Int(readLine()!)!
    }
    gameBoard[input-1] = curPlayer
    print()
}

func isValid(input: Int) -> Bool{
    if input < 1 || input > 9{
        print("Out of Range. Input again: ", terminator: "")
        return false
    } else if gameBoard[input-1] != 0{
        print("Place occupied. Input again: ", terminator: "")
        return false
    }
    return true
}

func checkIfDraw(numRounds: Int) -> Bool{
    if numRounds > 9 {
        return true
    }
    return false
}

func checkIfWin(curPlayer: Int, gameBoard: [Int]) -> Bool {
    // check horizontal
    for i in 0...2 {
        if gameBoard[i] == gameBoard[i+1] && gameBoard[i] == gameBoard[i+2] && gameBoard[i] == curPlayer {
            return true
        }
    }
    // check vertical
    for i in 0...2 {
        if gameBoard[i] == gameBoard[i+3] && gameBoard[i] == gameBoard[i+6] && gameBoard[i] == curPlayer {
            return true
        }
    }
    // check slant
    if gameBoard[0] == gameBoard[4] && gameBoard[0] == gameBoard[8] && gameBoard[4] == curPlayer {
        return true
    }
    if gameBoard[2] == gameBoard[4] && gameBoard[2] == gameBoard[6] && gameBoard[4] == curPlayer {
        return true
    }
    
    return false
}
