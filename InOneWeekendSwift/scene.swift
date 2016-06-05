import Foundation

/*
 * Note that this does not (on my computer) produce quite the same set of small spheres as in the book,
 * likely a result of a difference in the random function. I suspect the author changed to using drand48()
 * in an update to the book, but the image was not updated. (Given the time it takes to produce the final
 * image, that seems likely to be the case.)
 */
func randomScene() -> hitableList {
    
    var world = hitableList(list: [])
    
    world.list.append(sphere(center: vec3(0, -1000, 0), radius: 1000, material: lambertian(0.5, 0.5, 0.5)))
    
    // Some functions and variables to simplify the procedural code to follow:
    func lambColor() -> vec3 {
        return vec3(frand() * frand(), frand() * frand(), frand() * frand())
    }
    
    func metalColor() -> vec3 {
        return vec3(0.5 * (1 + frand()), 0.5 * (1 + frand()), 0.5 * (1 + frand()))
    }
    
    func dither(position: Int) -> Float {
        return Float(position) + 0.9 * frand()
    }
    
    let smallRadius: Float = 0.2
    
    // Procedurally add random spheres:
    for a in -11..<11 {
        for b in -11..<11 {
            
            let chooseMat = frand()
            let center = vec3(dither(a), smallRadius, dither(b))
            
            if (center - vec3(4, smallRadius, 0)).length() > 0.9 {
                
                switch chooseMat {
                case 0.8..<0.95: // metal
                    world.list.append(sphere(center: center,
                        radius: smallRadius,
                        material: metal(specular: metalColor(), roughness: 0.5 * frand())))
                    
                case 0.95...1: // glass
                    world.list.append(sphere(center: center,
                        radius: smallRadius,
                        material: dielectric(ior: 1.5)))
                    
                default: // diffuse
                    world.list.append(sphere(center: center,
                        radius: smallRadius,
                        material: lambertian(albedo: lambColor())))
                }
            }
        }
    }
    
    world.list.append(sphere(center: vec3(0, 1, 0), radius: 1, material: dielectric(ior: 1.5)))
    world.list.append(sphere(center: vec3(-4, 1, 0), radius: 1, material: lambertian(0.4, 0.2, 0.1)))
    world.list.append(sphere(center: vec3(4, 1, 0), radius: 1, material: metal(0.7, 0.6, 0.5, roughness: 0.0)))
    
    return world
}