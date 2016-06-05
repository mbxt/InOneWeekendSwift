import Foundation

struct hitRecord {
    
    let t: Float
    let p: vec3
    let normal: vec3
    let material: materialType
    
    init(t: Float, p: vec3, normal: vec3, material: materialType) {
        self.t = t
        self.p = p
        self.normal = normal
        self.material = material
    }
}

/*
 * We return the `hitRecord` as an optional, rather than modify an instance passed by reference.
 * As a result, `hitRecord` is returned as a constant struct, which is actually more performant
 * in Swift than continually passing a single `hitRecord` by reference, as in the book's C++ code.
 *
 * Additionally, it should be noted that at least in this case, inheritance is more performant than
 * protocol conformance (i.e., using a class versus a protocol for the interface of the `hit` method).
 */
class hitable {
    func hit(r: ray, tMin: Float, tMax: Float) -> hitRecord? {
        return nil
    }
}