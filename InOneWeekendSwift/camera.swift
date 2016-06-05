import Foundation

func randomInUnitDisk() -> vec3 {
    
    var p: vec3
    repeat {
        p = 2 * vec3(frand(), frand(), 0) - vec3(1, 1, 0)
    } while dot(p, p) >= 1
    
    return p
}

final class camera {
    
    final let origin: vec3
    final let lowerLeftCorner: vec3
    final let horizontal: vec3
    final let vertical: vec3
    final let u, v, w: vec3
    final let lensRadius: Float
    
    init(lookFrom: vec3, lookAt: vec3, vUp: vec3, vFov: Float, aspect: Float, aperture: Float, focusDist: Float) {
        
        lensRadius = aperture / 2
        
        let theta = vFov * Float(M_PI) / 180;
        let halfHeight = tan(theta/2)
        let halfWidth = aspect * halfHeight
        
        origin = lookFrom
        
        w = (lookFrom - lookAt).unitVector()
        u = cross(vUp, w).unitVector()
        v = cross(w, u)
        
        lowerLeftCorner = origin - focusDist * (halfWidth * u + halfHeight * v + w)
        horizontal = 2 * halfWidth * focusDist * u
        vertical = 2 * halfHeight * focusDist * v
    }
    
    final func getRay(s: Float, _ t: Float) -> ray {
        
        let rd = lensRadius * randomInUnitDisk()
        let offset = u * rd.x + v * rd.y
        
        return ray(origin + offset, lowerLeftCorner + s * horizontal + t * vertical - origin - offset)
    }
}