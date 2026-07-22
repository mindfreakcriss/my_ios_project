//
//  NoteListView.swift
//  chapter2
//
//  Created by huangkaibo on 2026/7/22.
//

import SwiftUI

struct NoteListView: View {

    @State private var notes = Note.notes
    @State private var showNewNoteView: Bool = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                noteTitleView
                noteListView
            }
            addBtnView
        }
        //半弹出，模态窗口
        .sheet(isPresented: $showNewNoteView) {
            NewNoteView(showNewNoteView: $showNewNoteView, notes: $notes)
                .presentationDetents([.medium])
        }
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
    private var noteTitleView: some View {
        Text("Note笔记").font(.title).bold()
    }

    //笔记列表
    private var noteListView: some View {
        List($notes, editActions: .all) { $note in
            Text(note.noteContent)
        }
        .listStyle(.plain)
    }

}

#Preview {
    NoteListView()
}
