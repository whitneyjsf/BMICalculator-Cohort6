//
//  HistoryView.swift
//  MyBMICalculator
//
//  Created by Whitney Prajna Pundarika on 20/03/23.
//

import SwiftUI

struct HistoryView: View {
    
    @Binding var savedHistories: [BMI]
    
    var body: some View {
        List(savedHistories) { BMI in
            VStack {
                Text("\(Date().formatted(date: .abbreviated, time: .shortened))")
                    .foregroundColor(.gray)
                HStack{
                    Text(String(format: "%.2f", BMI.result))
                        .font(.title)
                        .bold()
                    Spacer()
                    Text("\(BMI.bmiScale())")
                        .font(.title2)
                        .foregroundColor(BMI.bmiScaleColor())
                }
                .padding(.top, -4)
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(
            savedHistories: .constant(
                [BMI(date: Date(), result: 12.52)])
        )
    }
}
