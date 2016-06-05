import Foundation

final class camera {

    final let origin: vec3
    final let lowerLeftCorner: vec3
    final let horizontal: vec3
    final let vertical: vec3

    init(lookFrom: vec3, lookAt: vec3, vUp: vec3, vFov: Float, aspect: Float) {
        
        let u, v, w: vec3
        
        let theta = vFov * Float(M_PI) / 180
        let halfHeight = tan(theta / 2)
        let halfWidth = aspect * halfHeight
        
        origin = lookFrom
        
        w = (lookFrom - lookAt).unitVector()
        u = cross(vUp, w).unitVector()
        v = cross(w, u)
        
        lowerLeftCorner = origin - (halfWidth * u + halfHeight * v + w)
        horizontal = 2 * halfWidth * u
        vertical = 2 * halfHeight * v
    }

    final func getRay(u: Float, _ v: Float) -> ray {

        return ray(origin, lowerLeftCorner + u * horizontal + v * vertical - origin)
    }
}