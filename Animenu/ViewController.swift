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

import UIKit


class ViewController: UITableViewController {
    
    let scalingRange = -50..<0
    fileprivate var baseWidth: CGFloat = 0
    
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    
    fileprivate lazy var bezier: CubicBezier = {
        let p0 = CGPoint(x: 0, y: 0)
        let c0 = CGPoint(x: 0.5, y: 0)
        let p1 = CGPoint(x: 1.5, y: 1.5)
        return CubicBezier(p0: p0, p1: p1, c0: c0, c1: p1)
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        baseWidth = imageWidth.constant
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationItem.prompt = "Hello World"
    }

}


extension ViewController /* UITableViewDataSource */ {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "{ \(indexPath.row) }"
        return cell
    }

    
}

extension ViewController /* UIScollViewDelegate */ {
    
    fileprivate var scrollAmount: CGFloat {
        return tableView.contentInset.top + tableView.contentOffset.y
    }
    
    // This requires something far more subtle, definitely a curve rather than linear
    // and maybe an asymptote. Also, needs to top out at a scale of √2, say 
    fileprivate func scale() -> CGFloat {
        return tween(low: 1.0, actual: 1.0 + -(scrollAmount) / 50.0, high: 2.0)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scalingRange.contains(Int(scrollAmount)) {
            imageWidth.constant = baseWidth * scale()
        }
    }
}
