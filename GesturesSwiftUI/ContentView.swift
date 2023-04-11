//
//  ContentView.swift
//  GesturesSwiftUI
//
//  Created by sss on 11.04.2023.
//

import SwiftUI

struct SequencedView: View {
    
    @State var tapped = false
    @State var isDragging = false
    @State var currentOffsetX: CGFloat = 0
    
    var drag: some Gesture {
       DragGesture()
        
            .onChanged({ value in
                withAnimation {
                    currentOffsetX = value.translation.width
                    self.isDragging.toggle()
                }
            })
            .onEnded { _ in
                withAnimation(.spring()) {
                    self.isDragging.toggle()
                    currentOffsetX = 0
                    tapped.toggle()
                }
            }
    }
    var long: some Gesture {
        LongPressGesture(minimumDuration: 2)
            .onEnded { _ in
                withAnimation {
                    self.tapped.toggle()
                }
            }
    }
    
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(tapped ? .blue : .red)
                .frame(width: 200, height: 100)
            Text("Sequenced")
        }
        .offset(x: currentOffsetX)
        .gesture(long.sequenced(before: drag))
    }
}


struct ContentView: View {
    var body: some View {
        VStack {
            SequencedView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 struct TapView: View {
     @State var tapped = false
     
     var tap: some Gesture {
         TapGesture(count: 1)
             .onEnded { _ in
                 self.tapped.toggle()
             }
     }
     
     var body: some View {
         ZStack {
             RoundedRectangle(cornerRadius: 10)
                 .fill(tapped ? .blue : .red)
                 .frame(width: 200, height: 100)
             Text("Tap")
         }.gesture(tap)
     }
 }
 */

/*
 struct LongView: View {
     @State var tapped = false
     
     var long: some Gesture {
         LongPressGesture(minimumDuration: 2)
             .onEnded { _ in
                 withAnimation {
                     self.tapped.toggle()
                 }
             }
     }
     
     var body: some View {
         ZStack {
             RoundedRectangle(cornerRadius: 10)
                 .fill(tapped ? .blue : .red)
                 .frame(width: 200, height: 100)
             Text("Long")
         }.gesture(long)
     }
 }

 */

/*
 struct DragView: View {
     
     @State var isDragging = false
     @State var currentOffsetX: CGFloat = 0
     
     var drag: some Gesture {
        DragGesture()
         
             .onChanged({ value in
                 withAnimation {
                     currentOffsetX = value.translation.width
                     self.isDragging.toggle()
                 }
             })
             .onEnded { _ in
                 withAnimation(.spring()) {
                     self.isDragging.toggle()
                     currentOffsetX = 0
                 }
             }
     }
     
     var body: some View {
         ZStack {
             RoundedRectangle(cornerRadius: 10)
                 .fill(isDragging ? .blue : .red)
                 .frame(width: 200, height: 100)
             Text("Drag")
         }
         .gesture(drag)
         .offset(x: currentOffsetX)
     }
 }


 struct ContentView: View {
     var body: some View {
         VStack {
             DragView()
         }
         .padding()
     }
 }
 */

/*
 struct MagnificationView: View {
     
     @State var scale: CGFloat = 1
     
     var magnification: some Gesture {
        MagnificationGesture()
         
             .onChanged({ value in
                  scale = value
             })
             .onEnded { _ in
                 scale = 1
             }
     }
     
     var body: some View {
         ZStack {
             RoundedRectangle(cornerRadius: 10)
                 .fill(.red)
                 .frame(width: 200, height: 100)
             Text("Magnification")
         }
         .scaleEffect(scale)
         .gesture(magnification)
     }
 }

 */

/*
 struct RotationView: View {
     
     @State var angle = Angle(degrees: 0.0)
     
     var rotation: some Gesture {
        RotationGesture()
         
             .onChanged({ angle in
                 self.angle = angle
             })
             .onEnded { _ in
                 withAnimation(.spring()) {
                     self.angle = Angle(degrees: 0.0)
                 }
             }
     }
     
     var body: some View {
         ZStack {
             RoundedRectangle(cornerRadius: 10)
                 .fill(.red)
                 .frame(width: 200, height: 100)
             Text("Rotation")
         }
         .rotationEffect(angle)
         .gesture(rotation)
     }
 }

 */
