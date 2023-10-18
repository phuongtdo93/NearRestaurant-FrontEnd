//
//  ReservationScreen.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/16/23.
//

import SwiftUI

struct CreateReservationScreen: View {
    let restaurantName: String
    let restaurantAddress: String
    let optionList: [String]
    @State private var numberOfPersons = ""
    @State private var reserveDate = Date.now
    @State private var reserveTime = Date.now
    var body: some View {
        VStack {
            ReservationInfoView(restaurantName: restaurantName, restaurantAddress: restaurantAddress, optionList: ["2 persons", "3 persons"]).padding()
            Text("Congratulation! You reserved successfully!")
            VStack {
                Text("Unfortunately! Your reservation is failed.")
                Text("Please do it again!")
            }
            Spacer()
        }
    }
}

struct ReservationScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreateReservationScreen(restaurantName: "Restaurant 1", restaurantAddress: "123 Chouner Town, TX, 887665", optionList: ["2 persons", "3 persons"])
    }
}
