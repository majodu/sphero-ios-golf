//: Playground - noun: a place where people can play

import UIKit
var image = UIImage()

var str = "Hello, playground"
var map = [[Int]]();

for x in 0...999{
    for y in 0...999{
        map[x][y] = 0
    }
}

class navigate_map {
    var map = [[Int]]();
	
	init(chosenMap: [[Int]]) {
		map = chosenMap
	}
	
	func puttGolfBallTo(x: Double, y: Double) -> (success: Bool, stop: Bool) {
		
		return (false, false)
	}
	
    
}
