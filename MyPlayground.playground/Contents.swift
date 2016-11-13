//: Playground - noun: a place where people can play

// class to pass location of sphero and pass' back whether to stop or not
// pass' back if it got into a hole.

import UIKit

var image = UIImage(named:"test")?.cgImage;

func image(fromPixelValues pixelValues: [UInt8]?, width: Int, height: Int) -> CGImage?
{
    var imageRef: CGImage?
    if var pixelValues = pixelValues {
        let bitsPerComponent = 8
        let bytesPerPixel = 1
        let bitsPerPixel = bytesPerPixel * bitsPerComponent
        let bytesPerRow = bytesPerPixel * width
        let totalBytes = height * bytesPerRow
        
        imageRef = withUnsafePointer(to: &pixelValues, {
            ptr -> CGImage? in
            var imageRef: CGImage?
            let colorSpaceRef = CGColorSpaceCreateDeviceGray()
            let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue).union(CGBitmapInfo())
            let data = UnsafeRawPointer(ptr.pointee).assumingMemoryBound(to: UInt8.self)
            let releaseData: CGDataProviderReleaseDataCallback = {
                (info: UnsafeMutableRawPointer?, data: UnsafeRawPointer, size: Int) -> () in
            }
            
            if let providerRef = CGDataProvider(dataInfo: nil, data: data, size: totalBytes, releaseData: releaseData) {
                imageRef = CGImage(width: width,
                                   height: height,
                                   bitsPerComponent: bitsPerComponent,
                                   bitsPerPixel: bitsPerPixel,
                                   bytesPerRow: bytesPerRow,
                                   space: colorSpaceRef,
                                   bitmapInfo: bitmapInfo,
                                   provider: providerRef,
                                   decode: nil,
                                   shouldInterpolate: false,
                                   intent: CGColorRenderingIntent.defaultIntent)
            }
            
            return imageRef
        })
    }
    
    return imageRef
}

func pixelValues(fromCGImage imageRef: CGImage?) -> [UInt8]
{
    var width = 0
    var height = 0
    var pixelValues: [UInt8]?
    if let imageRef = imageRef {
        width = imageRef.width
        height = imageRef.height
        let bitsPerComponent = imageRef.bitsPerComponent
        let bytesPerRow = imageRef.bytesPerRow
        let totalBytes = height * bytesPerRow
        
        let colorSpace = CGColorSpaceCreateDeviceGray()
        var intensities = [UInt8](repeating: 0, count: totalBytes)
        
        let contextRef = CGContext(data: &intensities, width: width, height: height, bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: 0)
        contextRef?.draw(imageRef, in: CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height)))
        
        pixelValues = intensities
    }
    
    return pixelValues!;
};
var pixel_vals = pixelValues(fromCGImage: image)
var map_array = [[Int]]()
var array_size = 4
for row in 0...array_size{
    var row_arr = Array(repeating: 0, count: array_size)
    for col in 0...array_size{
        if pixel_vals[(col+1)*row] == UInt8(0){
            row_arr[col] = 0;
        }else{
            row_arr[col] = 255;
        }
    }
    map_array.append(row_arr);
}
map_array
struct Hole {
	var map: [[Int]]
	var start: (x: Int, y: Int)
	var end: (x: Int, y: Int)
}

class PuttPuttGameLogic {
	var chosenHole: Hole
    
	init(givenHole: Hole) {
		chosenHole = givenHole
		
		for x in 0...999 {
			for y in 0...999 {
				chosenHole.map[x][y]=0;
			}
		}
	}
	

	
    func puttGolfBallTo(ballX: Int, ballY: Int) -> (success: Bool, stop: Bool) {
        if(chosenHole.end.x != ballX && chosenHole.end.y != ballY){
            return(false, false)
        }else if(ballX == 0 || ballY == 0){
            return(false, false)
        }else{
            return(true, true)
        }
        
        
	}

}
