import Foundation

final class sphere: hitable {
    
    final let center: vec3
    final let radius: Float
    final let material: materialType
    
    init(center: vec3, radius: Float, material: materialType) {
        self.center = center
        self.radius = radius
        self.material = material
    }
    
    final override func hit(r: ray, tMin: Float, tMax: Float) -> hitRecord? {
        
        let oc = r.origin - center
        let a = dot(r.direction, r.direction)
        let b = dot(oc, r.direction)
        let c = dot(oc, oc) - radius * radius
        let discriminant = b * b - a * c
        
        if discriminant > 0 {
            
            var temp = (-b - sqrt(discriminant)) / a
            if temp < tMax && temp > tMin {
                
                let t = temp
                let p = r.pointAtParameter(t)
                let normal = (p - center) / radius
                
                return hitRecord(t: t, p: p, normal: normal, material: material)
            }
            
            temp = (-b + sqrt(discriminant)) / a
            if temp < tMax && temp > tMin {
                
                let t = temp
                let p = r.pointAtParameter(t)
                let normal = (p - center) / radius
                
                return hitRecord(t: t, p: p, normal: normal, material: material)
            }
        }
        
        return nil
    }
}