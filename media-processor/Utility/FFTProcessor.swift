//
//  FFTProcessor.swift
//  media-processor
//
//  Created by Alex Maslov on 2018-09-18.
//  Copyright © 2018 Alex Maslov. All rights reserved.
//

import Foundation
import Accelerate
import UIKit

class FFTProcessor {
    
    func test () {
        
        /*
        guard let image = UIImage(named: "city-colors") else {print("image not found");return}
        guard let cgImage = image.cgImage else {print("image is ciimage-based");return}
        
        let pixelCount = Int(image.size.width * image.size.height)
        let pixelData = cgImage.dataProvider?.data
        let pixels: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
 */
        
        let pixelArray = [1,2,3,4]
        let pixels:UnsafePointer<UInt8> = [1,2,3,4]
        let pixelCount = pixelArray.count
 
        var floatPixels = [Float](repeating: 0,
                                  count: pixelCount)
        vDSP_vfltu8(pixels,
                    1,
                    &floatPixels,
                    1,
                    vDSP_Length(pixelCount))
        print(floatPixels)
    }
}
