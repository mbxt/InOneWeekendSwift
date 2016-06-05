import Foundation

final class camera {

    final let origin: vec3
    final let lowerLeftCorner: vec3
    final let horizontal: vec3
    final let vertical: vec3

    init() {
        lowerLeftCorner = vec3(-2, -1, -1)
        horizontal = vec3(4, 0, 0)
        vertical = vec3(0, 2, 0)
        origin = vec3(0, 0, 0)
    }

    final func getRay(u: Float, _ v: Float) -> ray {

        return ray(origin, lowerLeftCorner + u * horizontal + v * vertical - origin)
    }
}