//
//  Octocat.swift
//  Animations
//
//  Created by Muhammad Aarfeen on 30/07/2022.
//

import SwiftUI

struct HeartBtn: View {
    @State var animateHeart = false
    @State var animateDots = false
    @State var animateCircle = false
    @State var removeStroke = false
    
    @State var scale = 1.0
    var body: some View {
        ZStack {
            
            // small dots
            ZStack {
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(Color(.sRGB, red: 0.99, green: 0.30, blue: 0.28, opacity: animateDots ? 0.0 : 1.0))
                    .offset(animateDots ? CGSize(width: 0.0, height: -70.0) : .zero)
                
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(Color(.sRGB, red: 0.99, green: 0.30, blue: 0.28, opacity: animateDots ? 0.0 : 1.0))
                    .offset(animateDots ? CGSize(width: 50.0, height: 50.0) : .zero)
                
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(Color(.sRGB, red: 0.99, green: 0.30, blue: 0.28, opacity: animateDots ? 0.0 : 1.0))
                    .offset(animateDots ? CGSize(width: 70.0, height: 0.0) : .zero)
                
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(Color(.sRGB, red: 0.99, green: 0.30, blue: 0.28, opacity: animateDots ? 0.0 : 1.0))
                    .offset(animateDots ? CGSize(width: 50.0, height: -50.0) : .zero)
                
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(Color(.sRGB, red: 0.99, green: 0.30, blue: 0.28, opacity: animateDots ? 0.0 : 1.0))
                    .offset(animateDots ? CGSize(width: 0.0, height: 70.0) : .zero)
                
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(Color(.sRGB, red: 0.99, green: 0.30, blue: 0.28, opacity: animateDots ? 0.0 : 1.0))
                    .offset(animateDots ? CGSize(width: -50.0, height: 50.0) : .zero)
                
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(Color(.sRGB, red: 0.99, green: 0.30, blue: 0.28, opacity: animateDots ? 0.0 : 1.0))
                    .offset(animateDots ? CGSize(width: -70.0, height: 0.0) : .zero)
                
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(Color(.sRGB, red: 0.99, green: 0.30, blue: 0.28, opacity: animateDots ? 0.0 : 1.0))
                    .offset(animateDots ? CGSize(width: -50.0, height: -50.0) : .zero)
            }
            
            // Big circle
            Circle()
                .frame(width: 10, height: 10)
                .scaleEffect(animateCircle ? 15 : 0)
                .foregroundColor(Color(.sRGB, red: 0.99, green: 0.30, blue: 0.28, opacity: animateCircle ? 0.0 : 1.0))
            
            
            Heart()
                .foregroundColor(animateHeart ? Color(.sRGB, red: 0.99, green: 0.30, blue: 0.28, opacity: 1.0) : .white)
              
                .scaleEffect(scale)
                .overlay(
                    Heart()
                        .stroke(lineWidth: removeStroke ? 0 : 5)
                        .scaleEffect(scale)
                )
                .onTapGesture {
                    if animateDots == true {
                        animateDots = false
                        animateHeart = false
                        animateCircle = false
                        removeStroke = false
                    } else {
                        withAnimation(Animation
                            .spring(dampingFraction: 0.2)
                            .speed(2)
                            , {
                                Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: { _ in
                                    scale = 1.0
                                })
                                scale = 1.5
                                animateHeart = true
                                
                            })
                        
                        withAnimation(Animation
                            .easeOut.delay(0.2)
                        ) {
                            animateDots = true
                        }
                        
                        withAnimation(Animation
                            .easeOut, {
                            animateCircle = true
                        })
                        
                        removeStroke = true
                    }
                    
                }
            
        }
    }
}
struct Heart: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.49504*width, y: 0.16004*height))
        path.addCurve(to: CGPoint(x: 0.7063*width, y: 0.00196*height), control1: CGPoint(x: 0.56022*width, y: 0.0823*height), control2: CGPoint(x: 0.60588*width, y: 0.01508*height))
        path.addCurve(to: CGPoint(x: 0.97306*width, y: 0.41542*height), control1: CGPoint(x: 0.89486*width, y: -0.02281*height), control2: CGPoint(x: 1.06828*width, y: 0.19803*height))
        path.addCurve(to: CGPoint(x: 0.82975*width, y: 0.62322*height), control1: CGPoint(x: 0.94596*width, y: 0.47733*height), control2: CGPoint(x: 0.89079*width, y: 0.55097*height))
        path.addCurve(to: CGPoint(x: 0.63672*width, y: 0.83921*height), control1: CGPoint(x: 0.76278*width, y: 0.70254*height), control2: CGPoint(x: 0.68864*width, y: 0.78028*height))
        path.addLine(to: CGPoint(x: 0.49512*width, y: 0.99991*height))
        path.addLine(to: CGPoint(x: 0.37809*width, y: 0.87105*height))
        path.addCurve(to: CGPoint(x: 0.00016*width, y: 0.27884*height), control1: CGPoint(x: 0.2373*width, y: 0.71595*height), control2: CGPoint(x: 0.00773*width, y: 0.52072*height))
        path.addCurve(to: CGPoint(x: 0.24618*width, y: 0.00279*height), control1: CGPoint(x: -0.00513*width, y: 0.10939*height), control2: CGPoint(x: 0.11174*width, y: 0.00084*height))
        path.addCurve(to: CGPoint(x: 0.49504*width, y: 0.16004*height), control1: CGPoint(x: 0.36629*width, y: 0.00466*height), control2: CGPoint(x: 0.41683*width, y: 0.07299*height))
        path.addLine(to: CGPoint(x: 0.49504*width, y: 0.16004*height))
        path.addLine(to: CGPoint(x: 0.49504*width, y: 0.16004*height))
        path.closeSubpath()
        return path
    }
}

struct HeartPre: PreviewProvider {
    static var previews: some View {
        HeartBtn()
    }
}
