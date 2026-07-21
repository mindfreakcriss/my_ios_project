//
//  NewNoteView.swift
//  chapter2
//
//  Created by criss on 2026/7/21.
//
import SwiftUI

struct NewNoteView: View {
    @Binding var showNewNoteView: Bool
    @Binding var notes: [Note]
    @State private var inputText: String = ""
    
    var body: some View {
        VStack(spacing:20) {
            HStack {
                closeBtnView
                Spacer()
                submitBtnView
            }
            .padding(.horizontal)
            inputTextView
            Spacer()
        }
    }
    
    //文本框
    private var inputTextView: some View {
        TextField("请输入",text: $inputText)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
    }
    
    //关闭按钮
    private var closeBtnView: some View {
        Button(action: {
            self.showNewNoteView.toggle()
        }) {
            Image(systemName: "chevron.down.circle.fill")
                .font(.system(size: 20))
                .foregroundColor(Color(.systemGray3))
        }
    }
    
    //完成按钮
    private var submitBtnView: some View {
        Button(action: {
            self.showNewNoteView.toggle()
            self.notes.append(Note(noteContent: inputText))
        }) {
            Text("完成")
                .font(.system(size: 17))
                .foregroundColor(.white)
                .padding(.all, 8)
                .background(.green)
                .cornerRadius(8)
        }
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView(showNewNoteView: .constant(false), notes: .constant([]))
    }
}
