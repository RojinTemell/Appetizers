//
//  OrderView.swift
//  Appetizers
//
//  Created by rojin on 15.04.2026.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var orderviewmodel :OrderViewModel
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List{
                        ForEach(orderviewmodel.orders) { order in
                            MealWidget(meal:order )
                        }
                        .onDelete(perform: orderviewmodel.delete)

                    }

                    if !orderviewmodel.orders.isEmpty
                    {
                        Button{

                        }label :{
                            Text("Place Order")

                        }
                        .modifier(StandarButtonStyle())
                        .padding(.bottom,20)
                    }
                }
                if orderviewmodel.orders.isEmpty {
                    EmptyView(imageName: "robot", message:  "You have no items in your order.\nPlease add an appetizer!")
                }


            }.navigationTitle("Orders")

        }
    }
}

#Preview {
    OrderView().environmentObject(OrderViewModel())
}
