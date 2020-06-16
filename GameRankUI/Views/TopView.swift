//
//  TopView.swift
//  GameRankUI
//
//  Created by yongzhan on 2020/6/16.
//  Copyright © 2020 yongzhan. All rights reserved.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                HStack{
                    Image("apple")
                    .resizable()
                        .frame(width: 24, height: 24)
                    Text("Arcade")
                }
                Text("商店3000款游戏免费玩，办理月卡58元")
                    .foregroundColor(.secondary)
                    .font(.system(size: 12))
            }
            Spacer()
            Button(action: {
                
                
            }) {
                Text("立即订购")
                    .foregroundColor(Color.white)
                    .padding(.vertical,8)
                    .padding(.horizontal)
                    .background(Color.blue)
                .clipShape(Capsule())
            }
        }
        .padding()
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
    .background(TopViewBackground())
    
    }
}


struct TopViewBackground: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
             TopView()
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
       
    }
}
