//
//  main.swift
//  Tic Tac Toe
//
//  Created by Lo Hoa Tsun Colin on 2/7/2022.
//  Copyright © 2022 Lo Hoa Tsun Colin. All rights reserved.
//

import Foundation

var gameBoard = [Int]()
var playerWin = false
var numRounds = 1
var curPlayer = 1

initGameBoard(gameBoard: &gameBoard)

while(!playerWin){
    getPlayerInput(curPlayer: curPlayer)
    displayBoard(gameBoard: gameBoard)
    if checkIfDraw(numRounds: numRounds) {
        print("This is a Draw!")
        break
    }
    if checkIfWin(curPlayer: curPlayer, gameBoard: gameBoard) {
        print("Player \(curPlayer) Win!")
        break
    }
    curPlayer = numRounds % 2 + 1
    numRounds += 1
}
