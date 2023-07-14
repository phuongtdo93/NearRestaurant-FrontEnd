//
//  TestingView.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/3/23.
//

import SwiftUI

struct TestingView: View {
    var body: some View {
        AsyncImage(
          //1
          url: URL(string: "https://mars.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/03373/opgs/edr/ncam/NRB_696919762EDR_S0930000NCAM00594M_.JPG")
        //2
        ) { image in
          image
            .resizable()
            .aspectRatio(contentMode: .fit)
          //3
          } placeholder: {
            Image("image1")
          }
    }
}

struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        TestingView()
    }
}
