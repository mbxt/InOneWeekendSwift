import Foundation

final class camera {

    final let origin: vec3
    final let lowerLeftCorner: vec3
    final let horizontal: vec3
    final let vertical: vec3

    init(vFov: Float, aspect: Float) {
        
        let theta = vFov * Float(M_PI) / 180
        let halfHeight = tan(theta / 2)
        let halfWidth = aspect * halfHeight
        
        lowerLeftCorner = vec3(-halfWidth, -halfHeight, -1)
        horizontal = vec3(2 * halfWidth, 0, 0)
        vertical = vec3(0, 2 * halfHeight, 0)
        origin = vec3(0, 0, 0)
    }

    final func getRay(u: Float, _ v: Float) -> ray {

        return ray(origin, lowerLeftCorner + u * horizontal + v * vertical - origin)
    }
}