import Foundation

let nx = 200
let ny = 100

print("P3\n\(nx) \(ny)\n255\n")

for j in (0..<ny).reverse() {
    for i in 0..<nx {
        
        let col = vec3(Float(i) / Float(nx), Float(j) / Float(ny), 0.2)
        
        let ir = Int(255.99 * col.r)
        let ig = Int(255.99 * col.g)
        let ib = Int(255.99 * col.b)
        
        print("\(ir) \(ig) \(ib)")
    }
}