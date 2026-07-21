//
//  Untitled.swift
//  chapter2
//
//  Created by huangkaibo on 2026/7/21.
//
import SwiftUI

//快捷登录按钮
struct LoginBtnView: View {
    var btnName: String
    var btnTextColor: Color
    var btnBackgroundColor: Color
    
    var body: some View {
        Text(btnName)
            .foregroundColor(btnTextColor)
            .frame(maxWidth: .infinity,maxHeight: 48)
            .background(btnBackgroundColor)
            .cornerRadius(8)
    }
}
