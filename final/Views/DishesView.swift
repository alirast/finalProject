//
//  DishesView.swift
//  final
//
//  Created by N S on 03.07.2023.
//

import SwiftUI

struct DishesView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var vm = DishesViewModel()
    @State private var selectedTeg: String?
    @State var name = ""
    @State private var select = 0
   
    let data = Array(1...100).map({ "Item\($0)" })
    let layout = [GridItem(.adaptive(minimum: 90), alignment: .top)]
    
    let category: Category
    
    var body: some View {
        TabView(selection: $select) {
            ZStack {
                VStack {
                    Spacer()
                    ScrollView(.horizontal) {
                        HStack(alignment: .top) {
                            ForEach(vm.tegs.indices, id: \.self) { tegIndex in
                                let teg = vm.tegs[tegIndex]
                                let firstTeg = vm.tegs[0]
                                
                                if vm.tegs[tegIndex] == firstTeg && selectedTeg == nil {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color(uiColor: UIColor(red: CGFloat(51.0/255), green: CGFloat(100.0/255), blue: CGFloat(224.0/255), alpha: 1.0))).frame(width: 80, height: 35)
                                        .overlay {
                                            VStack(alignment: .leading) {
                                                Text(firstTeg)
                                                    .foregroundColor(Color.white)
                                                    .font(.custom("SFProDisplay", fixedSize: 14))
                                            }
                                        }
                                        .onTapGesture {
                                            selectedTeg = firstTeg
                                            print("selected teg \(selectedTeg)")
                                        }
                                } else {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(selectedTeg == teg ?  Color(uiColor: UIColor(red: CGFloat(51.0/255), green: CGFloat(100.0/255), blue: CGFloat(224.0/255), alpha: 1.0)) : Color(red: CGFloat(248.0/255), green: CGFloat(247.0/255), blue: CGFloat(245.0/255)))
                                        .frame(width: 80, height: 35)
                                        .overlay {
                                            VStack(alignment: .leading) {
                                                Text(teg)
                                                    .foregroundColor(selectedTeg == teg ? Color.white : Color.black)
                                                    .font(.custom("SFProDisplay", fixedSize: 14))
                                            }
                                        }
                                    
                                        .onTapGesture {
                                            selectedTeg = teg
                                            print("selected tag: \(vm.tegs[tegIndex])")
                                        }
                                    
                                }
                            }
                        }
                    }.padding(.horizontal)
                    
                    
                    ScrollView {
                        
                        LazyVGrid(columns: layout, spacing: 10) {
                            ForEach(vm.dishes, id: \.self) { dish in
                                
                                if selectedTeg == nil || selectedTeg == dish.tegs[0] {
                                    if dish.tegs.contains(dish.tegs[0]) {
                                        VStack(alignment: .leading, spacing: 4) {
                                            Spacer()
                                                .frame(width: 109, height: 109)
                                                .background(Color(red: CGFloat(248.0/255), green: CGFloat(247.0/255), blue: CGFloat(245.0/255)))
                                                .background(Color.gray)
                                                .cornerRadius(10)
                                                .overlay {
                                                    AsyncImage(url: URL(string: dish.image_url)) { image in
                                                        image
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(maxWidth: 79, maxHeight: 88, alignment: .center)
                                                    } placeholder: {
                                                        Image(systemName: "photo.on.rectangle.angled")
                                                    }
                                                }
                                            
                                            Text(dish.name)
                                                .font(.custom("SFProDisplay", fixedSize: 14))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                        }.onTapGesture {
                                            print("CHOSEN")
                                            vm.selectedDish = dish
                                            vm.isShowingDetailView = true
                                            print(vm.selectedDish?.tegs)
                                            guard let selectedTag = selectedTeg else { return }
                                            print(dish.tegs.contains(selectedTag))
                                        }
                                        .padding(.horizontal)
                                    }
                                    
                                } else if dish.tegs.contains(selectedTeg!) {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Spacer()
                                            .frame(width: 109, height: 109)
                                            .background(Color(red: CGFloat(248.0/255), green: CGFloat(247.0/255), blue: CGFloat(245.0/255)))
                                            .background(Color.gray)
                                            .cornerRadius(10)
                                            .overlay {
                                                AsyncImage(url: URL(string: dish.image_url)) { image in
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(maxWidth: 79, maxHeight: 88, alignment: .center)
                                                } placeholder: {
                                                    Image(systemName: "photo.on.rectangle.angled")
                                                }
                                            }
                                        
                                        Text(dish.name)
                                            .font(.custom("SFProDisplay", fixedSize: 14))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }.onTapGesture {
                                        print("CHOSEN")
                                        vm.selectedDish = dish
                                        vm.isShowingDetailView = true
                                        print(vm.selectedDish?.tegs)
                                        guard let selectedTag = selectedTeg else { return }
                                        print(dish.tegs.contains(selectedTag))
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }.disabled(vm.isShowingDetailView)
                            .padding(.bottom)
                            .padding(.horizontal, 10)
                    }.blur(radius: vm.isShowingDetailView ? 20 : 0)
                    
                    
                    
                }
                if vm.isShowingDetailView {
                    if let selectedItemInMenu = vm.selectedDish {
                        ChosenDishView(treat: selectedItemInMenu, isShowingDetailView: $vm.isShowingDetailView)
                    }
                }
            }
            
        }
        .navigationTitle(category.name)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavBackButton(dismiss: self.dismiss))
        
        .toolbar {
            CategoryToolbar()
            
        }

    }

}

/*struct DishesView_Previews: PreviewProvider {
    static var previews: some View {
        DishesView()
    }
}*/
