//
//  CameraPageView.swift
//  nc1
//
//  Created by Rio Johanes Sumolang on 21/03/23.
//

import SwiftUI

struct CameraPageView: View {
    @StateObject var camera = CameraModel()
    var body: some View {
        ZStack {
            Color(0xFEDF3F)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center){
                HStack {
                    Button (action: {
                        // back to LandingPageView()
                    },
                            label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 15, height: 25)
                            .foregroundColor(.black)
                            .padding()
                    })
                    Spacer()
                    Text("Take a selfie with.. \n **\(learners.randomElement()!)!**")
                        .multilineTextAlignment(.center)
                        .font(.title3)
                        
                        .foregroundColor(.black)
                    Spacer()
                }
                CameraView()
                ZStack { // Shutter Button
                    Circle()
                        .fill(.black)
                        .frame(width: 120, height: 120)
                    Circle()
                    .fill(.white)
                    .frame(width: 100, height: 100)
                    Button (action: camera.takePic,
                            label: {
                            Image("Bee2")
                                .resizable()
                                .renderingMode(.original)
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


let learners = ["Abner Edgar", "Achmad Syarief Thalib", "Adriel Bernard Rusli", "Ahmad Kamaluddin", "Albert Ernesto", "Alvito", "Angelica Pinonkuan", "Ardi Rakhmat Ismail", "Ardli Fadhillah Wangsaatmaja", "Ario Rahmat Syahputra", "Asyifa Tasya Fadilah", "Audrey Kaitlyn Winarto", "Audriella Ruth Jim", "Aysha Hafizhatul Kamila", "Azella Gania Mutyara", "Bayu Alif Farisqi", "Bayu Syafrezal Izdham", "Belinda Angelica", "Beni Garcia", "Bobby Sugiharto", "Brandon Nicolas Marlim The", "Clarabella Lius", "Cris Rearisky Bawana", "Dary Ramadhan Fajar", "Deka Primatio Deandra", "Dhil Khairan Badjiser", "Dwianditya Hanif Raharjanto", "Edwin Hans Wijaya", "Elvis Susanto", "Eric Prasetya Sentosa", "Evelyn Belinda", "Farhany Richas", "Febrian Daniel Hamonangan", "Febriandianto P", "Felix Natanael", "Femi Rachma Pertiwi ", "Fernando Putra", "Ferrian Redhia Pratama", "Hannah Nur Azzahrah", "Hemalia Desty Kirana", "I Made Dwi Mahardika", "Indah Rahmawati", "Intan Saliya Utomo", "James Jeremia", "Jason Leonardo Sutioso", "Jeremy Nathaniel Christopher", "Jessica Audrey Octavia Saputra", "Jessica Rachel Santoso", "Jevon Levin", "Jonathan Heriyanto", "Juliandy", "Kevin Christanto", "Kezia Gloria Lie", "Khadijah Rizqy Mufida", "Kresna Faza Rizkyawan", "Laurensius Rivian Pratama ", "Leo Harnadi Marlin", "Leonard Theodorus", "Mahatmaditya Favian Rachman Syarief", "Matthew Togi", "Michelle Annice Tjitra", "Millennian Ibnu Adriansyah Karinda", "Monika Felicia", "Muhamad Ivan Putra Eriansya", "Muhammad Fauzul Akbar", "Muhammad Hilmy Noerfatih", "Muhammad Irsyad Rouyani", "Muhammad Naufal Nabiel", "Muhammad Rizki Ardyan", "Nadya Tyandra", "Nathania Wiranda", "Naufal Rahmadaffa Ariekananda", "Nicholas Yvees", "Nicolas Amory Putra Fiandi", "Octavian", "Paraptughessa Premaswari", "Prima Putra Samosir", "Priskilla Adriani Seciawanto", "Rachmaniar Larasati", "Radya Amirur Rahman", "Rahel Kristhea Supandi", "Randy Julian Gunawan", "Rio Johanes Sumolang", "Rivan Mohammad Akbar", "Robby Rizal", "Rosa Tiara Galuh", "Sarah Uli Octavia", "Sebastian Gery Krishnadi", "Sekarwulan", "Theodore Radithya", "Theresa Tiffany Tanadji", "Tiffany Angela Indryani", "Vanessa Eleazar Houdman", "Wardah", "Wincun Marthadiarto", "Wita Dewisari Tasya", "Yuga Samuel", "Yuri Wardana", "Zahra Aquila", "Zanira Sultana Rifda"]
