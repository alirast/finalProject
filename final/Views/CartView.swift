//
//  CartView.swift
//  final
//
//  Created by N S on 03.07.2023.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cartItem: CartItemModel

    @State private var number = 1

    @State private var item: String = ""
    
    @State private var string: String = ""
  
    var body: some View {
        VStack {
            ScrollView {

                ForEach(cartItem.items, id: \.self) { item in
                    VStack {
                        Spacer()
                        HStack {
                            VStack(alignment: .leading) {
                                HStack(spacing: 3) {
                                    Spacer()
                                        .frame(width: 62, height: 62)
                                        .background(Color(red: CGFloat(248.0/255), green: CGFloat(247.0/255), blue: CGFloat(245.0/255)))
                                        .cornerRadius(10)
                                        .overlay {
                                            AsyncImage(url: URL(string: item.image_url)) { image in
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(maxWidth: 50,
                                                           maxHeight: 50,
                                                           alignment: .center)
                                            } placeholder: {
                                                Image(systemName: "photo.on.rectangle.angled")
                                            }
                                    }
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.custom("SFProDisplay", size: 14))
                                        HStack(spacing: 3) {
                                            Text("\(item.price) ₽")
                                                .font(.custom("SFProDisplay", size: 14))
                                            Text("•")
                                                .foregroundColor(.gray)
                                            Text("\(item.weight) г")
                                                .font(.custom("SFProDisplay", size: 14))
                                                .foregroundColor(.gray)
                                        }
                                        
                                    }
                                }
                            }.frame(width: 250, alignment: .leading)
                            
                            
                            VStack(alignment: .trailing) {
                                HStack {
                                    Spacer()
                                        .frame(width: 99, height: 32)
                                        .background(Color(red: CGFloat(248.0/255), green: CGFloat(247.0/255), blue: CGFloat(245.0/255)))
                                        .cornerRadius(10)
                                        .overlay {
                                            HStack(spacing: 20) {
                                                Button(action: {
                                                    if number > 0 {
                                                        //number -= 1
                                                    }
                                                }) {
                                                    Image(systemName: "minus")
                                                        .foregroundColor(.black)
                                                }
                                                Text("\(number)")
                                                
                                                Button(action: {
                                                    number += 1
                                                    string += String(cartItem.totalPrice)
                                                    guard let num = Int(string) else { return }
                                                    string = String(num * number)
                                                }) {
                                                    Image(systemName: "plus")
                                                        .foregroundColor(.black)
                                                }
                                            }
                                        }
                                }
                            }.frame(width: 100, alignment: .trailing)
                        }
                        Spacer()
                    }
                }
                
            }
            
            
            Spacer()
            
            Button {
                print("Оплатить")
            } label: {
                if string.isEmpty {
                    Text("Оплатить \(cartItem.totalPrice) ₽")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(uiColor: UIColor(red: CGFloat(51.0/255), green: CGFloat(100.0/255), blue: CGFloat(224.0/255), alpha: 1.0)))
                        .cornerRadius(10)
                } else {
                    Text("Оплатить \(string) ₽")
                    
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(uiColor: UIColor(red: CGFloat(51.0/255), green: CGFloat(100.0/255), blue: CGFloat(224.0/255), alpha: 1.0)))
                        .cornerRadius(10)
                }
            }
            .padding()
        }
   
       
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}

