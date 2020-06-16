//
//  GameHome.swift
//  GameRankUI
//
//  Created by yongzhan on 2020/6/16.
//  Copyright © 2020 yongzhan. All rights reserved.
//

import SwiftUI

let screen = UIScreen.main.bounds

struct GameHome: View {
    var games: [Game] = Game.stubbed
    @State var show = false
    @State var timer = Timer.publish(every: 0.1, on: .current, in: .tracking).autoconnect()
    var body: some View {
        ZStack(alignment: .top){
            ScrollView {
                
                VStack{
                    GeometryReader { proxy in
                        
                        Image("header")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: screen.width, height: screen.height * 0.55  +  proxy.frame(in: .global).minY)
                            .clipped()
                            .offset(y:  -proxy.frame(in: .global).minY)
                            .onReceive(self.timer) { (_) in
                                let y = proxy.frame(in: .global).minY
                                
                                if -y > screen.height * 0.55  - 50 {
                                    withAnimation{
                                        self.show = true
                                    }
                                    
                                } else {
                                    withAnimation{
                                        self.show = false
                                    }
                                }
                        }
                        
                    }
                    .frame(width: screen.width, height: screen.height * 0.55)
                    
                }
                
                self.renderGameList()
            }
            
            // header
            
            if self.show {
                TopView()
            }else {
                HStack {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "arrow.left")
                    }
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
                .foregroundColor(Color.white)
                .font(.system(size: 30, weight: .medium))
                .padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            }
            
            
        }
        .background(Color(red: 237/255, green: 237/255, blue: 227/255))
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: !show)
    }
    
    func renderGameList() -> some View{
        
        VStack {
            
            HStack{
                Rectangle().fill(Color.black).frame(width: 50, height:3)
                    .cornerRadius(3)
                Text("2020年度游戏排行")
                    .font(.system(size: 30))
                Rectangle().fill(Color.black).frame(width: 50, height:3)
                    .cornerRadius(3)
            }
            
            ForEach(games) { game in
                GameItem(game: game)
            }
        }
        
    }
}

struct GameHome_Previews: PreviewProvider {
    static var previews: some View {
        GameHome()
    }
}
