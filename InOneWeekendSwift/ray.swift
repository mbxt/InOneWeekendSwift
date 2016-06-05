import Foundation

/*
 * A stylistic diversion from the book is made here to replace
 * vec3 A, B with vec3 origin, direction, respectively.
 *
 * `ray` here is a struct instead of a class for similar reasoning to `vec3`.
 */

struct ray {
    
    let origin: vec3
    let direction: vec3
    
    init(origin: vec3, direction: vec3) {
        self.origin = origin
        self.direction = direction
    }
    
    init(_ origin: vec3, _ direction: vec3) {
        self.origin = origin
        self.direction = direction
    }
    
    func pointAtParameter(t: Float) -> vec3 {
        return origin + t * direction
    }
}