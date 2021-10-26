
import SwiftUI

struct RectangleBreath: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.closeSubpath()

        
   
        
//
//        path.move(to: CGPoint(x: 200, y: 0))
//                   path.addLine(to: CGPoint(x: 200, y: 200))
//                   path.addLine(to: CGPoint(x: 0, y: 200))
//                   path.addLine(to: CGPoint(x: 0, y: 0))
//                   path.closeSubpath()

       
        
        
        return path
    }
    
  
}

