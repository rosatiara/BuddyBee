//
//  CameraPageView.swift
//  nc1
//
//  Created by Rio Johanes Sumolang on 21/03/23.
//

import SwiftUI

struct CameraPageView: View {
    let learner = learners.randomElement()!
    @StateObject var camera = CameraModel()
    
    @State private var isConfettiAnimating = false
    
    var body: some View {
        ZStack {
            Color(0xFEDF3F)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center){
                    Text("Take a selfie with.. \n 📸 \(learner) 📸")
                        .multilineTextAlignment(.center)
                        .font(.title3)
                        .foregroundColor(.black)
                        .bold()
                CameraView()
                ZStack { // Shutter Button
                    Circle()
                        .fill(.black)
                        .frame(width: 120, height: 120)
                    Circle()
                    .fill(.white)
                    .frame(width: 100, height: 100)
                    Button (action: {
                        camera.takePic()
                        isConfettiAnimating = true
//                        if isConfettiAnimating {
//                            ConfettiView(isConfettiAnimating: $isConfettiAnimating)
//                            .frame(maxWidth: .infinity, maxHeight: .infinity)
//                            .transition(.opacity)
//                        }
                    } ,
                            label: {
                            Image("Bee2")
                                .resizable()
                                .frame(width: 65, height: 65)
                                .offset(x: 2)
                                
                    })
                    .frame(width: 60, height: 60)
                }
            }
        }
    }
}

struct CameraPageView_Previews: PreviewProvider {
    static var previews: some View {
        CameraPageView()
    }
}


let learners = ["Abner Edgar", "Achmad Syarief Thalib", "Adriel Bernard Rusli", "Ahmad Kamaluddin", "Albert Ernesto", "Alvito", "Angelica Pinonkuan", "Ardi Rakhmat Ismail", "Ardli Fadhillah", "Ario Rahmat Syahputra", "Asyifa Tasya Fadilah", "Audrey Kaitlyn Winarto", "Audriella Ruth Jim", "Aysha Hafizhatul", "Azella Gania Mutyara", "Bayu Alif Farisqi", "Bayu Syafrezal Izdham", "Belinda Angelica", "Beni Garcia", "Bobby Sugiharto", "Brandon Nicolas", "Clarabella Lius", "Cris Rearisky Bawana", "Dary Ramadhan Fajar", "Deka Primatio Deandra", "Dhil Khairan", "Dwianditya Hanif", "Edwin Hans Wijaya", "Elvis Susanto", "Eric Prasetya Sentosa", "Evelyn Belinda", "Farhany Richas", "Febrian Daniel", "Febriandianto P.", "Felix Natanael", "Femi Rachma Pertiwi ", "Fernando Putra", "Ferrian Redhia Pratama", "Hannah Nur Azzahrah", "Hemalia Desty Kirana", "I Made Dwi Mahardika", "Indah Rahmawati", "Intan Saliya Utomo", "James Jeremia", "Jason Leonardo Sutioso", "Jeremy Nathaniel", "Jessica Audrey Octavia", "Jessica Rachel Santoso", "Jevon Levin", "Jonathan Heriyanto", "Juliandy", "Kevin Christanto", "Kezia Gloria Lie", "Khadijah Rizqy Mufida", "Kresna Faza Rizkyawan", "Laurensius Rivian", "Leo Harnadi Marlin", "Leonard Theodorus", "Mahatmaditya Favian", "Matthew Togi", "Michelle Annice Tjitra", "Millennian Ibnu Adriansyah", "Monika Felicia", "Muhamad Ivan Putra", "Muhammad Fauzul Akbar", "Muhammad Hilmy Noerfatih", "Muhammad Irsyad", "Muhammad Naufal Nabiel", "Muhammad Rizki Ardyan", "Nadya Tyandra", "Nathania Wiranda", "Naufal Rahmadaffa", "Nicholas Yvees", "Nicolas Amory", "Octavian", "Paraptughessa Premaswari", "Prima Putra Samosir", "Priskilla Adriani", "Rachmaniar Larasati", "Radya Amirur Rahman", "Rahel Kristhea Supandi", "Randy Julian Gunawan", "Rio Johanes", "Rivan Mohammad Akbar", "Robby Rizal", "Rosa Tiara Galuh", "Sarah Uli Octavia", "Sebastian Gery Krishnadi", "Sekarwulan", "Theodore Radithya", "Theresa Tiffany", "Tiffany Angela Indryani", "Vanessa Eleazar", "Wardah", "Wincun Marthadiarto", "Wita Dewisari Tasya", "Yuga Samuel", "Yuri Wardana", "Zahra Aquila", "Zanira Sultana Rifda"]
