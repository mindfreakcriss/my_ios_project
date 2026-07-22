//
//  LoginView.swift
//  chapter2
//
//  Created by huangkaibo on 2026/7/22.
//

import SwiftUI

struct LoginView: View {
    @State var isAgree: Bool = false
    
    var body: some View {
        VStack(spacing:32) {
            pageImageView
            sloganTextView
            authorizedLoginBtnView
            userAgreementView
        }.padding(40).background(Color.bgColor)
    }
    
    //封面图片
    private var pageImageView: some View {
        VStack {
            Spacer()
            
            Image("cover_page").resizable().aspectRatio(contentMode: .fit)
            
            Spacer()
        }
    }
    //slogan文字
    private var sloganTextView: some View {
        Text("good good study, day day up").font(.title2).bold().foregroundColor(.purple)
    }
    
    //快捷登录入口
    private var authorizedLoginBtnView: some View {
        VStack(spacing:10) {
            Button(action: {}) {
                LoginBtnView(btnName: "微信登录", btnTextColor: .white, btnBackgroundColor: .green)
            }
            Button(action:{}) {
                LoginBtnView(btnName: "QQ登录", btnTextColor: .white, btnBackgroundColor: .blue)
            }
            Button(action:{}) {
                LoginBtnView(btnName: "Apple登录", btnTextColor: .white, btnBackgroundColor: .black)
            }
            Button(action:{}) {
                LoginBtnView(btnName: "手机号登录", btnTextColor: .black, btnBackgroundColor: Color(.systemGray5))
            }
        }
    }
    //用户条款
    private var userAgreementView: some View {
        HStack {
            Button(action:{
                self.isAgree.toggle()
            }) {
                Image(systemName: isAgree ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(isAgree ? .green : .gray)
            }
            Text("已阅读并同意隐私政策和用户协议")
        }
        .font(.system(size: 14))
        .foregroundColor(.gray)
    }
    
}

#Preview {
    LoginView()
}
