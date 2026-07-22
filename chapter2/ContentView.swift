//
//  ContentView.swift
//  chapter2
//
//  Created by huangkaibo on 2026/7/21.
//

import SwiftUI

struct ContentView: View {
    
    let introductionText = "my name is criss, and be a iOS developer, i graduate on SCUT"
  
    //代码块的顺序决定了视图的先后顺序
    var body: some View {
        ScrollView {
            //基本信息栏
            VStack(spacing:32) {
                //个人头像
                Image("aver")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color(.systemGray5), lineWidth: 2))
                    .frame(width: 160)
                //个人信息
                VStack(spacing:10) {
                    Text("Mindfreak").font(.title2).bold()
                    Text("iOS&Python").font(.title3)
                    HStack {
                        Image(systemName: "location.circle.fill").foregroundColor(.gray)
                        Text("Guangzhou").font(.title3).foregroundColor(.gray)
                    }
                }
                //个人介绍
                Text(introductionText).foregroundColor(.gray)
                //个人成就栏
                HStack {
                    VStack(spacing:10) {
                        Text("25").font(.title2).bold()
                        Text("focus").font(.system(size:14)).foregroundColor(.gray)
                    }
                    Spacer()
                    VStack(spacing:10) {
                        Text("1157").font(.title2).bold()
                        Text("follower").font(.system(size:14)).foregroundColor(.gray)
                    }
                    Spacer()
                    VStack(spacing:10) {
                        Text("1.2W").font(.title2).bold()
                        Text("power").font(.system(size:14)).foregroundColor(.gray)
                    }
                }.padding(.horizontal,48).padding(.vertical,20).background(Color(.systemGray6)).cornerRadius(16).padding(.horizontal,20).padding(.vertical,20)
                //文章专栏
                ForEach(Article.articles, id:\.title) { item in
                    HStack(spacing:20) {
                        Image(item.image).resizable().frame(width: 80,height: 80).cornerRadius(4)
                        //文字信息
                        VStack(alignment: .leading) {
                            HStack {
                                Text(item.title).font(.title2).bold()
                                Spacer()
                                Image(systemName: "ellipsis").foregroundColor(.gray)
                            }
                            Spacer()
                            HStack(spacing: 20) {
                                Text("\(item.articleNum)" + "篇文章")
                                Text("\(item.subcription)" + "人订阅")
                            }.foregroundColor(.gray)
                        }.padding(.vertical,20)
                        Spacer()
                    }.frame(height: 80)
                }
            }.padding()
        }
    }
}

#Preview {
    ContentView()
}
