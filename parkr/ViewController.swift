//  Created by Andrew Brown on 1/17/16.
//  Copyright © 2016 markovAntony. All rights reserved.

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        drawParkingLines()
    }
    
    func drawParkingLines() {
        let lineWidth = CGFloat(10.0)
        let edgePadding = CGFloat(7.0)
        let numLines = 3
        
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        
        let start_y = UIApplication.sharedApplication().statusBarFrame.height
        
        for index in 0...numLines - 1 {
            let line = CAShapeLayer()
            let path = UIBezierPath()
            
            var x = CGFloat(index) * (width / CGFloat(numLines - 1))
            x = index == 0 ? x + edgePadding : index == numLines - 1 ? x - edgePadding : x
            
            path.moveToPoint(CGPoint(x: x, y: start_y))
            path.addLineToPoint(CGPoint(x: x, y: height / 1.5))
        
            line.lineWidth = lineWidth
            line.path = path.CGPath
            line.fillColor = UIColor.whiteColor().CGColor;
            line.strokeColor = UIColor.whiteColor().CGColor
        
            self.view.layer.addSublayer(line)
        }
    }
}