//: Playground - noun: a place where people can play

// class to pass location of sphero and pass' back whether to stop or not
// pass' back if it got into a hole.

import UIKit
<<<<<<< HEAD
var image: UIImage!
=======
var image = UIImage()
>>>>>>> 5f6009711500d41b477ec80378976364a2bc5385

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
