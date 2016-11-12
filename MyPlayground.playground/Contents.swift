//: Playground - noun: a place where people can play

// class to pass location of sphero and pass' back whether to stop or not
// pass' back if it got into a hole.

import UIKit

var image = UIImage();

var map=[[Int]]();

struct Hole {
	var map: [[Int]]
	var start: (x: Int, y: Int)
	var end: (x: Int, y: Int)
}

for x in 0...999{
    for y in 0...999{
        map[x][y]=0
    }
}

class navigate_map {
    var map = [[Int]]();
    
    /*for x in 0...999{
        for y in 0...999{
            map[x][y]=0;
        }
    }*/
    
	init(chosenMap: [[Int]]) {
		map = chosenMap
	}
	
	func puttGolfBallTo(x: Int, y: Int) -> (success: Bool, stop: Bool) {
        
        
		return (false, false)
	}

}
