//
//  game.swift
//  Tic Tac Toe
//
//  Created by Lo Hoa Tsun Colin on 2/7/2022.
//  Copyright © 2022 Lo Hoa Tsun Colin. All rights reserved.
//

import Foundation

let boardDashPrint = ("-----------")
var gameBoard = [Int]()

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


func initGameBoard(arr: inout [Int]){
    for _ in 0..<9{
        arr.append(0)
    }
}


func displayBoard(arr:[Int]) {
    print(boardDashPrint)
    
    for i in 0..<3{
        for j in 0..<3{
            let cell: String = getBoardCell(arr[i * 3 + j]) ?? String(i * 3 + j)
                
            print(" \(cell) ", terminator: "")
           
            if j < 2{
                print("|", terminator: "")
            }
        }
        print("\n\(boardDashPrint)")
    }
}

func getPlayerInput(curPlayer: Int){
    print("Please input from 0-8: ", terminator: "")
    let input: String = readLine()!
    gameBoard[Int(input)!] = curPlayer
}
