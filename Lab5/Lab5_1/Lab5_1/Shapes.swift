//
//  Shapes.swift
//  Lab5_1
//
//  Created by Mateusz Bartoszek on 14/03/2023.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect)->Path{
        var path = Path()
        path.move(to: CGPoint(x:rect.midX,y:rect.minY))
        path.addLine(to:CGPoint(x:rect.minX,y:rect.maxY))
        path.addLine(to:CGPoint(x:rect.maxX,y:rect.maxY))
        path.addLine(to:CGPoint(x:rect.midX,y:rect.minY))
        return path
    }
}


