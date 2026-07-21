//
//  ContentView.swift
//  chapter2
//
//  Created by huangkaibo on 2026/7/21.
//

import SwiftUI

struct ContentView: View {
    @State var isAgree: Bool = false
    @State private var notes = Note.notes
    @State private var showNewNoteView: Bool = false

      
    //代码块的顺序决定了视图的先后顺序
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                noteTitleView
                noteListView
            }
            addBtnView
        }
        .sheet(isPresented: $showNewNoteView) {
            NewNoteView(showNewNoteView: $showNewNoteView,notes: $notes)
                .presentationDetents([.medium])
        }
//        VStack(spacing:32) {
//            pageImageView
//            sloganTextView
//            authorizedLoginBtnView
//            userAgreementView
//        }
//        .padding(40)
//        .background(Color.bgColor)
    }
    
    //新增按钮
    private var addBtnView: some View {
        Button(action: {
            self.showNewNoteView.toggle()
        }) {
            Image(systemName: "plus.circle.fill").font(.system(size: 48)).padding(.horizontal)
        }
    }
    
    //界面标题
    private var noteTitleView : some View {
        Text("Note笔记").font(.title).bold()
    }
    
    //笔记列表
    private var noteListView: some View {
        List($notes, editActions: .all) {$note in
            Text(note.noteContent)
        }
        .listStyle(.plain)
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
    ContentView()
}
