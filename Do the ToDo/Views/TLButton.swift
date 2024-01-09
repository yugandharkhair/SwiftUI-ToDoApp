//
//  TLButton.swift
//  Do the ToDo
//
//  Created by Yugandhar Khair on 12/25/23.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(title: "Trial", background: Color.green) {
        //Action
    }
}
