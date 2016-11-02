/*
 MIT License
 
 Copyright (c) 2016 Cereopsis
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
*/

import CoreGraphics


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

/// Simple cubic bezier implementation
struct CubicBezier {
    
    let p0: CGPoint
    let p1: CGPoint
    let c0: CGPoint
    let c1: CGPoint
    
    /// Returns a CGPoint along the line at `interval`
    /// - parameter interval: normalised value that plugs into the cubic equation
    func point(at interval: CGFloat) -> CGPoint {
        let t = (1 - interval)
        let a = p0 * t.cubed
        let b = c0 * (3 * t.squared * interval)
        let c = c1 * (3 * t * interval.squared)
        let d = p1 * interval.cubed
        return a + b + c + d
    }
}

/// Clamps a value between a minimum and maximum
/// - Parameter low: minimal value
/// - Parameter actual: value to clamp
/// - Parameter high: maximal value
func tween<T: Comparable>(low: T, actual: T, high: T) -> T {
    return max(min(actual, high), low)
}
