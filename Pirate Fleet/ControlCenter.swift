//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}


struct Mine : _Mine_ {
    var location: GridLocation
    var explosionText: String
}

class ControlCenter {
    
    //var a = [[Int]]()
    //.
    
    func addShipsAndMines(human: Human) {
       // <#WRITE YOUR CODE HERE!#>
        let smallShip1 = Ship(length: 2, location: GridLocation(x: 0, y: 0), isVertical: false)
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 1), isVertical: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 0, y: 2), isVertical: false)
        let largeShip1 = Ship(length: 4, location: GridLocation(x: 0, y: 3), isVertical: false)
        let xlargeShip1 = Ship(length: 5, location: GridLocation(x: 0, y: 4), isVertical: false)
        let mine1 = Mine(location: GridLocation(x: 0, y: 5), explosionText: "Boom it")
        let mine2 = Mine(location: GridLocation(x: 0, y: 6), explosionText: "Boom it")
        human.addShipToGrid(smallShip1)
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(largeShip1)
        human.addShipToGrid(xlargeShip1)
        human.addMineToGrid(mine1)
        human.addMineToGrid(mine2)
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        var totalShips : Int {  // to get the total ships from the settings
            get{
                var ships = 0
               for ( _ , count ) in Settings.RequiredShips
               {
                ships += count
                }
                return ships
            }
        }
    
        let enemyShipsSunk = totalShips - gameStats.enemyShipsRemaining
        let sinkBonus = gameStats.sinkBonus
        let humanShipsRemaining = totalShips - gameStats.humanShipsSunk
        let numberOfGuesses = gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman
        let guessPenalty = gameStats.guessPenalty
        let shipBonus = gameStats.shipBonus
       finalScore = (enemyShipsSunk * sinkBonus) + (humanShipsRemaining * shipBonus) - (numberOfGuesses * guessPenalty)
        
        print("Your final score is \(finalScore)")
        return finalScore
    }
}