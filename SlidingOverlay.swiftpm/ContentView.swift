import SwiftUI

struct ContentView: View {
    @State private var offset = CGSize.zero
    @State private var frameWidth: CGFloat = 100
    
    var body: some View {
        VStack {
            ZStack {
                ZStack {
                    GeometryReader { reader in
                        VStack {
                            Image("Rainy_Street_Grid_Sketch")
                                .resizable()
                                .cornerRadius(50)
                                .aspectRatio(contentMode: .fit)
                                .clipped()
                        }
                        HStack {
                            Spacer()
                            VStack {
                                Image("Rainy_Street_Grid")
                                    .resizable()
                                    .cornerRadius(50)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 300)
                                    .clipped()
                            }
                            .frame(width: frameWidth - offset.width, alignment: .trailing)
                            .clipped()
                        }
                        slider
                    }
                }
                .shadow(radius: 20)
                .frame(width: 300)
                
            }
            .frame(width: 300, height: 350)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "#EFE6DD"))
    }
    
    @ViewBuilder
    private var slider: some View {
        ZStack {
            Rectangle()
                .fill(Color(hex: "#F28F3B"))
                .frame(width: 2)
            ZStack {
                Circle()
                    .fill(Color(hex: "#F28F3B"))
                    .frame(width: 25)
                HStack(spacing: 0) {
                    Image(systemName: "chevron.backward")
                    Image(systemName: "chevron.forward")
                }
                .font(.system(size: 12))
                .foregroundStyle(.black)
            }
        }
        .offset(x: 50 + (offset.width))
        .gesture(
            DragGesture()
                .onChanged{ gesture in
                    offset = gesture.translation
                }
        )
    }
}
