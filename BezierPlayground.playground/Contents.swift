//: Playground - noun: a place where people can play

import UIKit

extension CGFloat {
    
    var cubed: CGFloat {
        return self * squared
    }
    
    var squared: CGFloat {
        return self * self
    }
    
}

extension CGPoint {
    static func *(point: CGPoint, scalar: CGFloat) -> CGPoint {
        return CGPoint(x: point.x * scalar, y: point.y * scalar)
    }
    
    static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}

struct CubicBezier {
    let p0: CGPoint
    let p1: CGPoint
    let c0: CGPoint
    let c1: CGPoint
    
    func point(at time: CGFloat) -> CGPoint {
        let t = (1 - time)
        let a = p0 * t.cubed
        let b = c0 * (3 * t.squared * time)
        let c = c1 * (3 * t * time.squared)
        let d = p1 * time.cubed
        return a + b + c + d
    }
}

let pt0  = CGPoint(x: 0.5, y: 0.25)
let ctl0 = CGPoint(x: 0.75, y: 0)
let pt1  = CGPoint(x: 1, y: 0)
let ctl1 = CGPoint(x: 1, y: 0)
let cb = CubicBezier(p0: pt0, p1: pt1, c0: ctl0, c1: ctl1)

for t in 0...10 {
    let p = cb.point(at: CGFloat(t) / 10)
    print("scale -> \(p.x)")
}