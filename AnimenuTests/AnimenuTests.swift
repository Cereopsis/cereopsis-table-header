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

import XCTest
@testable import Animenu

class AnimenuTests: XCTestCase {
    
    lazy var bezier: CubicBezier = {
        let p0 = CGPoint(x: 1, y: 0)
        let p1 = CGPoint(x: 0.5, y: 0.5)
        let c1 = CGPoint(x: 1, y: 1)
        return CubicBezier(p0: p0, p1: p1, c0: p0, c1: c1)
    }()
    
    func testBezier() {
        var s = bezier.point(at: 0).x
        XCTAssertEqual(1.0, s)
        s = bezier.point(at: 1).x
        XCTAssertEqual(0.5, s)
    }
    
    func testTween() {
        XCTAssertEqual(0.5, tween(low: 0, actual: 0.5, high: 1))
        XCTAssertEqual(0.5, tween(low: 0.5, actual: 0.25, high: 1))
        XCTAssertEqual(0.5, tween(low: 0.5, actual: -0.5, high: 1))
        XCTAssertEqual(0.5, tween(low: 0, actual: 1.5, high: 0.5))
    }
    
    
}
