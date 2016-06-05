import Foundation

/*
 * We use a struct instead of a class for performance reasons.
 *
 * Under ARC (automated reference counting) in the Swift runtime, a reference object (a class)
 * would incur extra overhead for retain/release when it gets passed around (in other words,
 * when it gains or loses an owner). Since we're doing that in nearly every function call,
 * we would like to avoid this overhead. Additionally, reference types have a higher allocation
 * cost than value types.
 */
struct vec3 {
    
    var x: Float
    var y: Float
    var z: Float
    
    var r: Float { get { return x } }
    var g: Float { get { return y } }
    var b: Float { get { return z } }
    
    // For simpler initializing calls, we can elide the parameter names.
    init(_ x: Float, _ y: Float, _ z: Float) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    func squaredLength() -> Float {
        return dot(self, self)
    }
    func length() -> Float {
        return sqrt(squaredLength())
    }
    func unitVector() -> vec3 {
        return self / length()
    }
}

/*
 * Note that some operators (such as the [] subscript operator)
 * are not used in this codebase and are therefore omitted.
 */

// MARK: - Prefix operators
prefix func -(v: vec3) -> vec3 {
    return vec3(-v.x, -v.y, -v.z)
}

// MARK: - Scalar operations
func *(f: Float, v: vec3) -> vec3 {
    return vec3(f * v.x, f * v.y, f * v.z)
}

func *(v: vec3, f: Float) -> vec3 {
    return vec3(v.x * f, v.y * f, v.z * f)
}

func /(v: vec3, f: Float) -> vec3 {
    return vec3(v.x / f, v.y / f, v.z / f)
}

// MARK: - Vector multiplication
func dot(a: vec3, _ b: vec3) -> Float {
    return a.x * b.x + a.y * b.y + a.z * b.z
}

func cross(a: vec3, _ b: vec3) -> vec3 {
    return vec3((a.y * b.z - a.z * b.y),
                (-(a.x * b.z - a.z * b.x)),
                (a.x * b.y - a.y * b.x))
}

// MARK: - Assignment arithmetic operators
func +=(inout a: vec3, b: vec3) {
    a = vec3(a.x + b.x, a.y + b.y, a.z + b.z)
}
func /=(inout v: vec3, f: Float) {
    v = vec3(v.x / f, v.y / f, v.z / f)
}

// MARK: - Component arithmetic
func +(a: vec3, b: vec3) -> vec3 {
    return vec3(a.x + b.x, a.y + b.y, a.z + b.z)
}

func -(a: vec3, b: vec3) -> vec3 {
    return vec3(a.x - b.x, a.y - b.y, a.z - b.z)
}

func *(a: vec3, b: vec3) -> vec3 {
    return vec3(a.x * b.x, a.y * b.y, a.z * b.z)
}

func /(a: vec3, b: vec3) -> vec3 {
    return vec3(a.x / b.x, a.y / b.y, a.z / b.z)
}

// MARK: - Vector physics
func reflection(v: vec3, _ n: vec3) -> vec3 {
    return v - 2 * dot(v, n) * n
}