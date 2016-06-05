import Foundation

// We use frand to avoid typing `Float(drand48())` in a bunch of places.
func frand() -> Float {
    return Float(drand48())
}

func randomInUnitSphere() -> vec3 {
    
    var p: vec3
    repeat {
        p = 2 * vec3(frand(), frand(), frand()) - vec3(1, 1, 1)
    } while dot(p, p) >= 1
    
    return p
}

func color(r: ray, world: hitableList) -> vec3 {
    
    if let rec = world.hit(r, tMin: 0.0, tMax: MAXFLOAT) {
        
        let target = rec.p + rec.normal + randomInUnitSphere()
        return 0.5 * color(ray(rec.p, target - rec.p), world: world)
        
    } else {
        
        let unitDirection = r.direction.unitVector()
        let t = 0.5 * (unitDirection.y + 1.0)
        return (1.0 - t) * vec3(1, 1, 1) + t * vec3(0.5, 0.7, 1.0)
    }
}


// MARK: - Main
let nx = 200
let ny = 100
let ns = 100

print("P3\n\(nx) \(ny)\n255\n")

let lowerLeftCorner = vec3(-2, -1, -1)
let horizontal = vec3(4, 0, 0)
let vertical = vec3(0, 2, 0)
let origin = vec3(0, 0, 0)

let world = hitableList(list: [
    sphere(center: vec3(0, 0, -1), radius: 0.5),
    sphere(center: vec3(0, -100.5, -1), radius: 100),
    ])

let cam = camera()

for j in (0..<ny).reverse() {
    for i in 0..<nx {
        
        var col = vec3(0, 0, 0)
        
        for s in 0..<ns {
            
            let u = (Float(i) + frand()) / Float(nx)
            let v = (Float(j) + frand()) / Float(ny)
            
            let r = cam.getRay(u, v)
            col += color(r, world: world)
        }
        
        col /= Float(ns)
        col = vec3(sqrt(col.r), sqrt(col.g), sqrt(col.b))
        
        let ir = Int(255.99 * col.r)
        let ig = Int(255.99 * col.g)
        let ib = Int(255.99 * col.b)
        
        print("\(ir) \(ig) \(ib)")
    }
}