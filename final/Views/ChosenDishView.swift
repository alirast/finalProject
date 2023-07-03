//
//  ChosenDishView.swift
//  final
//
//  Created by N S on 03.07.2023.
//

import SwiftUI

struct ChosenDishView: View {
    let treat: Item
    @Binding var isShowingDetailView: Bool
    @EnvironmentObject var cartItem: CartItemModel

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack(spacing: 2) {
                ZStack(alignment: .topTrailing) {
                    Spacer()
                        .frame(width: 311, height: 232)
                        .background(Color(red: CGFloat(248.0/255), green: CGFloat(247.0/255), blue: CGFloat(245.0/255)))
                        .cornerRadius(10)
                        .overlay {
                            AsyncImage(url: URL(string: treat.image_url)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 198,
                                           maxHeight: 204,
                                           alignment: .center)
                            } placeholder: {
                                Image(systemName: "photo.on.rectangle.angled")
                            }
                        }
                    
                    HStack(spacing: 5) {
                        Spacer()
                            .frame(width: 40, height: 40)
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "heart")
                                        .font(.system(size: 28, weight: .bold))
                                        .foregroundColor(.black)
                                }
                            }
                        Spacer()
                            .frame(width: 40, height: 40)
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay {
                                Button {
                                    isShowingDetailView = false
                                } label: {
                                    Image(systemName: "xmark")
                                        .font(.system(size: 28, weight: .bold))
                                        .foregroundColor(.black)
                                }
                            }
                    }
                    .padding(.top, 10)
                    .padding(.trailing, 10)
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(treat.name)
                        .font(.custom("SFProDisplay", size: 16).bold())
                    HStack {
                        Text("\(treat.price)₽")
                            .font(.custom("SFProDisplay", size: 14))
                        Text("•")
                        Text("\(treat.weight)г")
                            .font(.custom("SFProDisplay", size: 14))
                            .foregroundColor(.gray)
                    }
                    
                    Text(treat.description)
                        .font(.custom("SFProDisplay", size: 14))
                        .fixedSize(horizontal: false, vertical: true)
                }
                .frame(width: 311, alignment: .leading)
                
                Spacer()
                
                Button {
                    isShowingDetailView = false
                    print(treat)
                    cartItem.add(treat)
        
                } label: {
                    Text("Добавить в корзину")
                        .foregroundColor(.white)
                        .font(.custom("SFProDisplay", size: 16))
                }
                    .frame(width: 311, height: 48)
                    .background(Color(uiColor: UIColor(red: CGFloat(51.0/255), green: CGFloat(100.0/255), blue: CGFloat(224.0/255), alpha: 1.0)))
                    .cornerRadius(10)

            }
            .padding(.vertical, 25)
            .padding(.horizontal, 30)
            .background()
            .cornerRadius(10)
        }
        .frame(maxWidth: 343, maxHeight: 446)
        .shadow(radius: 40)
        }

    }


struct ChosenDishView_Previews: PreviewProvider {
    static var previews: some View {
        ChosenDishView(treat: MockItem.sampleItem, isShowingDetailView: .constant(true))
    }
}
