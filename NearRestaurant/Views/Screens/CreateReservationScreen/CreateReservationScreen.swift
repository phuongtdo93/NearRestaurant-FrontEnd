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

struct CreateReservationScreen: View {
    @EnvironmentObject var restaurant: RestaurantWrappedViewModel
    
    var optionList: [String] {
        return Array(1...6).map { "\($0) persons" }
    }
    
    @StateObject var reservationVM: CreateReservationViewModel = CreateReservationViewModel(reservationService: ReservationService.instance)
    
    
    var body: some View {
        VStack {
            VStack (alignment: .leading){

                Text(restaurant.restaurant.name)
                    .fontWeight(.bold)
                Text(restaurant.restaurant.address)
                    .fontWeight(.thin)
                Picker("", selection: $reservationVM.numberOfPersons) {
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
                
                DatePicker("Date", selection: $reservationVM.createdDate, in: Date.now..., displayedComponents: [.date, .hourAndMinute])
                .padding(.bottom)
                
                Button("Book a reservation") {
                    reservationVM.createReservation()
                    
                    print("Date \($reservationVM.createdDate)")
                }
                .frame(maxWidth: .infinity)
                .padding(10)
                .background(Color(hex: CustomColor.moreRed))
                .cornerRadius(5)
                .foregroundColor(.white)
            }
            
            if reservationVM.reservationCreatedResult == .Success {
                Text("Congratulation! You reserved successfully!")
            }
            
            if reservationVM.reservationCreatedResult == .Fail {
                VStack {
                    Text("Unfortunately! Your reservation is failed.")
                    Text("Please do it again!")
                }
            }
            Spacer()
        }.padding()
            .onAppear(){
                reservationVM.numberOfPersons = optionList[0]
            }
    }
}

struct ReservationInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CreateReservationScreen().environmentObject(RestaurantWrappedViewModel(restaurant: RestaurantViewModel(restaurant: Restaurant.previewRestaurant())))
    }
}
