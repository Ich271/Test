//
//  ContentView.swift
//  Test
//
//  Created by Peter-Paul Manzel on 18.01.24.
//

import SwiftUI



#Preview {
    ContentView()
}



struct ContentView: View {
    
    
    
    @State private var isNight = false
    
    
    
    var body: some View {
        ZStack {
            
            BackgroundView(isNight: $isNight)
            
            VStack {
                
                cityTextView(cityName: "Darmstadt", country: "DE")
                
                weatherToday(image: !isNight ? "cloud.sun.fill" : "moon.stars.fill", temperature: 69)
                
                
                
                HStack(spacing: 16) {
                    
                    WeatherDayView(weekDay: "TUE", imageName: "cloud.sun.fill", temperature: 69)
                    WeatherDayView(weekDay: "WED", imageName: "sun.max.fill", temperature: 69)
                    WeatherDayView(weekDay: "THU", imageName: "wind.snow", temperature: 69)
                    WeatherDayView(weekDay: "FRI", imageName: "sunset.fill", temperature: 69)
                    WeatherDayView(weekDay: "SAT", imageName: "snow", temperature: 69)
                    
  
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    weatherButton(text: "Change Day Time")
                }
                
                Spacer()

            }
            
            
        }
    }
}







struct WeatherDayView: View {
    
    var weekDay: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack (spacing: 8){
            
            Text(weekDay)
            .font(.system(size: 16, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
        
        
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)")
                .font(.system(size: 40, weight: .medium))
                .foregroundColor(.white)
            
            
        }
        
        
    }
    
}

struct BackgroundView: View {
    
    
    @Binding var isNight: Bool

    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [isNight ? .black : .blue,
                                        isNight ?  .gray : Color("lightBlue")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}


struct cityTextView: View {
    var cityName: String
    var country: String
    
    var body: some View {
        Text("\(cityName), \(country)")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct weatherToday: View {
    
    var image: String
    var temperature: Int
    
    
    
    var body: some View {
        VStack (spacing: 8){
            Image(systemName: "\(image)")
                .symbolRenderingMode(.palette)
                .resizable()
                .foregroundStyle(.white, .yellow, .black)
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct weatherButton: View {
    
    var text: String
    
    var body: some View {
        Text("\(text)")
            .frame(width: 280, height: 50)
            .background(Color.white)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
            
    }
}



