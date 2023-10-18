//
//  CustomPicker.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/30/23.
//

import SwiftUI

struct CustomPicker: View {
    let optionList: [String]
    @Binding var selectedOption: String
    
    var body: some View {
        Picker("Select persion", selection: $selectedOption) {
            ForEach(optionList, id: \.self) { option in
                Text(option)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(5)
        .background(Color(hex: CustomColor.gray1))
        .cornerRadius(10)
    }
}

struct CustomPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomPicker(optionList: ["2 person", "3 person"], selectedOption: .constant("2 person"))
    }
}
