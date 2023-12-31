//
//  ApplePayButton.swift
//  NearRestaurant
//
//  Created by Salmdo on 12/12/23.
//
//import Foundation
import SwiftUI
import PassKit

struct PaymentHandler: UIViewRepresentable {
    let payAmount: Int
    
    static let supportedNetworks: [PKPaymentNetwork] = [
        .amex,
        .discover,
        .masterCard,
        .visa
    ]
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> some UIView {
        let result = PaymentHandler.applePayStatus()
        var button = PKPaymentButton()
        
        if result.canMakePayments {
            button = PKPaymentButton(paymentButtonType: .book, paymentButtonStyle: .black)
            button.addTarget(context.coordinator, action: #selector(context.coordinator.payPressed), for: .touchUpInside)
        } else if result.canSetupCards {
            button = PKPaymentButton(paymentButtonType: .setUp, paymentButtonStyle: .black)
            button.addTarget(self, action: #selector(context.coordinator.setupPressed), for: .touchUpInside)
        }
        button.cornerRadius = 50
        return button
    }
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: PaymentHandler
        
        init(_ parent: PaymentHandler) {
            self.parent = parent
        }
        
        @objc func payPressed(sender: AnyObject){
            print("Click pay \(parent.payAmount)")
        }
        
        @objc func setupPressed(){
            print("Click setup \(parent.payAmount)")
        }
    }
    
    static func applePayStatus() -> (canMakePayments: Bool, canSetupCards: Bool){
        return (PKPaymentAuthorizationController.canMakePayments(),
                PKPaymentAuthorizationController.canMakePayments(usingNetworks: supportedNetworks))
    }
    
    func shippingMethodCalculator() -> [PKShippingMethod] {
        let today = Date()
        let calendar = Calendar.current
        let shippingStart = calendar.date(byAdding: .day, value: 3, to: today)!
        let shippingEnd = calendar.date(bySetting: .day, value: 5, of: today)!
        
        let startComponents = calendar.dateComponents([.calendar, .year, .month, .day], from: shippingStart)
        let endComponents = calendar.dateComponents([.calendar, .year, .month, .day], from: shippingEnd)
        
        let shippingDelivery = PKShippingMethod(label: "Delivery", amount: NSDecimalNumber(string: "0.00"))
            shippingDelivery.dateComponentsRange = PKDateComponentsRange(start: startComponents, end: endComponents)
            shippingDelivery.detail = "Ticket sent to you address"
            shippingDelivery.identifier = "DELIVERY"
            
            let shippingCollection = PKShippingMethod(label: "Collection", amount: NSDecimalNumber(string: "0.00"))
            shippingCollection.detail = "Collect ticket at festival"
            shippingCollection.identifier = "COLLECTION"
            
            return [shippingDelivery, shippingCollection]
    }
    
    func collectPaymentSummaryItem() -> [PKPaymentSummaryItem] {
        let ticket = PKPaymentSummaryItem(label: "Festival Entry", amount: NSDecimalNumber(string: "9.99"), type: .final)
        let tax = PKPaymentSummaryItem(label: "Tax", amount: NSDecimalNumber(string: "1.00"), type: .final)
        let total = PKPaymentSummaryItem(label: "Total", amount: NSDecimalNumber(string: "10.99"), type: .final)
        return [ticket, tax, total]
    }
    
    func paymentRequestCalculator() {
        let paymentRequest = PKPaymentRequest()
        paymentRequest.paymentSummaryItems = collectPaymentSummaryItem()
        paymentRequest.merchantIdentifier = ""
        paymentRequest.merchantCapabilities = .capability3DS
        paymentRequest.countryCode = "US"
        paymentRequest.currencyCode = "USD"
        paymentRequest.supportedNetworks = PaymentHandler.supportedNetworks
        paymentRequest.shippingType = .delivery
        paymentRequest.shippingMethods = shippingMethodCalculator()
        paymentRequest.requiredShippingContactFields = [.name, .postalAddress]
    }
    
    func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
        
        // Perform basic validation on the provided contact information.
        var errors = [Error]()
        var status = PKPaymentAuthorizationStatus.success
        if payment.shippingContact?.postalAddress?.isoCountryCode != "US" {
            let pickupError = PKPaymentRequest.paymentShippingAddressUnserviceableError(withLocalizedDescription: "Sample App only available in the United States")
            let countryError = PKPaymentRequest.paymentShippingAddressInvalidError(withKey: CNPostalAddressCountryKey, localizedDescription: "Invalid country")
            errors.append(pickupError)
            errors.append(countryError)
            status = .failure
        } else {
            // Send the payment token to your server or payment provider to process here.
            // Once processed, return an appropriate status in the completion handler (success, failure, and so on).
        }
        
//        self.paymentStatus = status
        completion(PKPaymentAuthorizationResult(status: status, errors: errors))
    }
}
