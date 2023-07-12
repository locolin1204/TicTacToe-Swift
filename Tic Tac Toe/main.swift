//
//  main.swift
//  Tic Tac Toe
//
//  Created by Lo Hoa Tsun Colin on 2/7/2022.
//  Copyright © 2022 Lo Hoa Tsun Colin. All rights reserved.
//

import Foundation

initGameBoard(arr: &gameBoard)

var playerWin = false
var numRounds = 1
var curPlayer = 1

while(!playerWin){
    displayBoard(arr: gameBoard, curPlayer: curPlayer)
    if numRounds > 9 {
        print("This is a Draw!")
        break
    }
    getPlayerInput(curPlayer: curPlayer)
    curPlayer = numRounds % 2 + 1
    numRounds += 1
}
