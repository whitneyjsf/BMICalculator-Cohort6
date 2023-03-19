//
//  CalculatorView.swift
//  MyBMICalculator
//
//  Created by Whitney Prajna Pundarika on 20/03/23.
//

import SwiftUI

struct CalculatorView: View {
    
    @Binding var weight: Double
    @Binding var height: Double
    @Binding var savedHistories: [BMI]
    
    var body: some View {
        VStack{
            HStack{
                Text("Weight (kg)")
                    .font(.body)
                    .foregroundColor(.gray)
                Spacer()
                Text("\(String(format: "%g", weight.rounded()))")
                    .font(.title2)
                    .bold()
            }
            Slider(value: $weight, in: 45...120)
            
            HStack{
                Text("Height (cm)")
                    .font(.body)
                    .foregroundColor(.gray)
                Spacer()
                Text("\(String(format: "%g", height.rounded()))")
                    .font(.title2)
                    .bold()
            }
            .padding(.top, 20)
            Slider(value: $height, in: 100...200)
            
            HStack{
                Text("Your Body Mass Index")
                    .font(.body)
                    .foregroundColor(.gray)
                Spacer()
                VStack(alignment: .trailing){
                    // %.2f means a floating number of point 2 decimal digits after points
                    Text(String(format: "%.2f", calculateBmi()))
                        .font(.title)
                        .bold()
                    Text("\(bmiScale())")
                        .font(.body)
                        .foregroundColor(bmiScaleColor())
                }
            }
            .padding(.top, 30)
            
            Button {
                let newBmi = BMI(date: Date(), result: calculateBmi())
                savedHistories.insert(newBmi, at: 0)
            } label: {
                Text("Save to history")
                    .frame(maxWidth: .infinity, maxHeight: 32)
            }
            .background(.blue)
            .buttonStyle(.bordered)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(.top, 20)
            
            
            Spacer()
        }
        .padding()
    }
    
    func calculateBmi() -> Double {
        return weight * 10_000 / ( height * height )
    }
 
    func bmiScale() -> String {
        switch calculateBmi() {
        case 0 ..< 18.4:
            return "Underweight"
        case 18.5 ..< 24.9:
            return "Normal"
        case 25 ..< 39.9:
            return "Overweight"
        default:
            return "Obese"
        }
    }
    
    func bmiScaleColor() -> Color {
        switch calculateBmi() {
        case 0 ..< 18.4:
            return .blue
        case 18.5 ..< 24.9:
            return .green
        case 25 ..< 39.9:
            return .orange
        default:
            return .red
        }
    }
    
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(
            weight: .constant(70),
            height: .constant(172),
            savedHistories: .constant([])
        )
    }
}
