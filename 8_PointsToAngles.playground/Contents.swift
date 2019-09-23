import CoreGraphics

// Write a function that accepts an array of CGPoint pairs and returns an array of angles between each point pair. Return the angle in degrees, where 0 or 360 is straight up.

func anglesForPoints(_ points:[[String:CGPoint]]) -> [Double]
{
    let angles = points.compactMap { (pointPair) -> Double? in
        let x1 = pointPair["first"]!.x
        let y1 = pointPair["first"]!.y
        let x2 = pointPair["second"]!.x
        let y2 = pointPair["second"]!.y
        
        let angle = atan2(Double(y1-y2), Double(x1-x2))
        let angleInDegrees = (angle * 180 / Double.pi) - 90
        return angleInDegrees < 0 ? angleInDegrees+360 : angleInDegrees
    }
    return angles
}

let points = [["first":CGPoint.zero, "second":CGPoint(x: 0.0, y: -100)],["first":CGPoint.zero, "second":CGPoint(x: 100.0, y: -100)],["first":CGPoint.zero, "second":CGPoint(x: 100.0, y: 0)],["first":CGPoint.zero, "second":CGPoint(x: 100.0, y: 100)],["first":CGPoint.zero, "second":CGPoint(x: 0.0, y: 100)],["first":CGPoint.zero, "second":CGPoint(x: -100.0, y: 0)]]
anglesForPoints(points)
