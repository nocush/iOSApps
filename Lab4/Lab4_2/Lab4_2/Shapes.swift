//
//  Shapes.swift
//  Lab4_2
//
//  Created by Mateusz Bartoszek on 13/03/2023.
//

import SwiftUI

struct Triangles: Shape{
    func path(in rect: CGRect)->Path{
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y:rect.midY
                      ))
        path.addLine(to: CGPoint(x:rect.minX,y:rect.maxY))
        path.addLine(to: CGPoint(x:rect.maxX,y:rect.maxY))
        path.addLine(to: CGPoint(x:rect.maxX, y:rect.minY))
        
        return path
    }
}
