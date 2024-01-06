

import SwiftUI

struct Detail: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var item: Item
    @State var cartList: [Binding<Item>] = []
    @EnvironmentObject var global: CartViewModel


    var body: some View {
        ZStack {
            Color("Bg")
            ScrollView  {
                //            Product Image
                Image("\(item.image)")
                        .resizable()
                        .aspectRatio(1,contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                
                DescriptionView(item: $item)
                
            }
            .edgesIgnoringSafeArea(.top)
            
            HStack {
                Text("$\((Double(item.quantity)*item.price).convert())")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                
                Button {
                    print("Add to cart Button")
                    if !global.globalData.dataArray.contains(item){
                        global.globalData.dataArray.append(item)
                    }
                    print(global.globalData.dataArray)
                    
                } label: {
                    Text("Add to cart")
                }
                .font(.title3)
                .fontWeight(.semibold)
                 .foregroundColor(Color("Primary"))
                  .padding()
                  .padding(.horizontal, 8)
                    .background(Color.white)
                .cornerRadius(10.0)

                
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .cornerRadius(60.0, corners: .topLeft)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action:{
            presentationMode.wrappedValue.dismiss()} ,cartList: cartList), trailing: Image("threeDot"))
    }
    
}

struct Details: PreviewProvider {
    static var previews: some View {
        Detail(item: .constant(Item(name: "Luruxy Swedia", details: "Chair",description: "0", image: "chair_1", price: 20.99, quantity: 1, offset: 0, isSwiped: false)))
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct DescriptionView: View {
    @Binding var item: Item
    var body: some View {
        VStack (alignment: .leading) {
            //                Title
            Text("\(item.name) \nChair")
                .font(.title)
                .fontWeight(.bold)
            //                Rating
            HStack (spacing: 4) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text("Luxury Swedian Chair is a contemporary chair based on the virtues of modern craft. it carries on the simplicity and honestly of the archetypical chair.")
                .lineSpacing(8.0)
                .opacity(0.6)
            
            //                Info
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    Text("Size")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Text("Height: 120 cm")
                        .opacity(0.6)
                    Text("Wide: 80 cm")
                        .opacity(0.6)
                    Text("Diameter: 72 cm")
                        .opacity(0.6)
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack (alignment: .leading) {
                    Text("Treatment")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Text("Jati Wood, Canvas, \nAmazing Love")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            
            //                Colors and Counter
            HStack {
                VStack (alignment: .leading) {
                    Text("Colors")
                        .fontWeight(.semibold)
                    HStack {
                        ColorDotView(color: Color.white)
                        ColorDotView(color: Color.black)
                        ColorDotView(color: Color(#colorLiteral(red: 0.1803921569, green: 0.6352941176, blue: 0.6705882353, alpha: 1)))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    //                        Minus Button
                    Button(action: {
                        if item.quantity>0{
                            item.quantity-=1
                        }
                    }) {
                        Image(systemName: "minus")
                            .padding(.all, 8)
                        
                    }
                    .frame(width: 30, height: 30)
                    .overlay(RoundedCorner(radius: 50).stroke())
                    .foregroundColor(.black)
                    
                    Text("\(item.quantity)")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 8)
                    
                    //                        Plus Button
                    Button(action: {
                        item.quantity+=1
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(.all, 8)
                            .background(Color("Primary"))
                            .clipShape(Circle())
                    }
                }
                
            }
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .offset(x: 0, y: -30.0)
    }
}


struct BackButton: View {
    let action: () -> Void
    @State var cartList: [Binding<Item>] = []
    @State private var isPresented = false
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
        }
    }
}
