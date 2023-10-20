//
//  ReservationInfoView.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/16/23.
//

import SwiftUI

enum ReserveStatus {
    case New, Success, Fail
}

struct ReservationInfoView: View {
    let restaurantName: String
    let restaurantAddress: String
    let optionList: [String]
    @State private var numberOfPersons = ""
    @State private var reserveDate = Date.now
    @State private var reserveTime = Date.now
    var body: some View {
        VStack (alignment: .leading){

            Text(restaurantName)
                .fontWeight(.bold)
            Text(restaurantAddress)
                .fontWeight(.thin)
            Picker("", selection: $numberOfPersons) {
                ForEach(optionList, id: \.self) { option in
                    HStack {
                        Text(option)
                        Spacer()
                    }
                    
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color(hex: CustomColor.gray1))
            .cornerRadius(10)
            
            DatePicker("Date", selection: $reserveDate, in: Date.now..., displayedComponents: [.date, .hourAndMinute])
            .padding(.bottom)
            
            Button("Book a reservation") {
                print("Date \(reserveDate)")
                print("Date \(reserveTime)")
            }
            .frame(maxWidth: .infinity)
            .padding(10)
            .background(Color(hex: CustomColor.moreRed))
            .cornerRadius(5)
            .foregroundColor(.white)
        }
    }
}

struct ReservationInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationInfoView(restaurantName: "Luna Chine Town", restaurantAddress: "123 Chouner Town, TX, 887665", optionList: ["1 person","2 persons", "3 persons"])
    }
}
