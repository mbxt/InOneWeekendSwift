import Foundation

/*
 * Using a struct vs. a class gives ~10% performance gain in the final project.
 * Using ContinguousArray instead of Array removes overhead of providing bridging with NSArray.
 * It also turns out to be more performant in the long run to cache the values t, p, and normal,
 * rather than cache and continually reassign a `hitRecord` type variable.
 *
 * Also note that we don't need the `list_size` variable given the choice of a Swift standard library container.
 */

struct hitableList {
    
    var list: ContiguousArray<hitable>
    
    init(list: ContiguousArray<hitable>) {
        self.list = list
    }
    
    func hit(r: ray, tMin: Float, tMax: Float) -> hitRecord? {
        
        // Temporary hit record
        var t: Float = 0
        var p = vec3(0, 0, 0)
        var normal = vec3(0, 0, 0)
        var material: materialType?
        
        var closestSoFar = tMax
        
        for i in 0..<list.count {
            
            if let rec = list[i].hit(r, tMin: tMin, tMax: closestSoFar) {
                
                closestSoFar = rec.t
                
                t = rec.t
                p = rec.p
                normal = rec.normal
                material = rec.material
            }
        }
        
        if let material = material {
            return hitRecord(t: t, p: p, normal: normal, material: material)
        } else {
            return nil
        }
    }
}