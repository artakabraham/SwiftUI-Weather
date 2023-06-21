//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Artak Abrahamyan on 20.06.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false;
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack{
                CityView(cityName: "Yerevan")
                WeatherMainStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 28)
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "MON",
                                   imageName: "cloud.sun.fill",
                                   temperature: 20)
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "sun.max.fill",
                                   temperature: 15)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "wind.snow",
                                   temperature: 5)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "cloud.sun.fill",
                                   temperature: 13)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "snow",
                                   temperature: -1)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                } label:{
                    WeatherButton(title: "Change day time",
                                  textColor: .white,
                                  backgroundColor: .blue)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: ContentMode.fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,                                            isNight ? .gray : .blue]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityView: View{
    
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size:32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(.bottom)
    }
}

struct WeatherMainStatusView : View{
    
    var imageName: String
    var temperature: Int
    
    var body: some View{
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: ContentMode.fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
