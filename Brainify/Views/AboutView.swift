
import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack{
            Text("Information")
                .font(.title)
                .bold()
                .padding(.top, 50)
            Text("Brainify 🧠 is a user-firendly and versatile flashcard program designed to enhance your learning experience. Whether you're a student, professional, or anyone looking to improve your knowledge and skills, our app is tailored to meet your learning needs!")
                .padding(15)
            Text("Want to ace your exams, master new skills, or boost your knowledge in a fun and efficient way? Look no further than Brinify 🤩! We're here to supercharge your learning journey with our powerful💪🏻 flashcard engine!")
                .padding(15)
            Text("Just create a deck of flashcards, write down the things you need to remember and enjoy the experience! 💭")
                .padding(15)
            Text("Whether you're at home 🏡, on the bus 🚌, or waiting in line, you can learn things anywhere!")
                .padding(15)
            Text("Grupi 40 - Lorena Mekaj & Roni Kukaj")
                .padding(.top, 30)
            Text("Programimi ne Pajisje Mobile 2023/24")
        }
    }
}

#Preview {
    AboutView()
}
