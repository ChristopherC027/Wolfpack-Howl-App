//
//  ContentView.swift
//  DBCRWolfpack
//
//  Created by Christopher Castillo on 2/9/20.
//  Copyright © 2020 Christopher Castillo. All rights reserved.
//

import SwiftUI
import SwiftyJSON
import SDWebImageSwiftUI
import WebKit
import MessageUI
import UIKit
import Combine

class requestTranscript: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case fullName, classYear, emailAddress, needDate, vInstCompName, instCompEmail, pInstCompName, address, city, state, zipCode
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(fullName, forKey: .fullName)
        try container.encode(classYear, forKey: .classYear)
        try container.encode(emailAddress, forKey: .emailAddress)
        try container.encode(needDate, forKey: .needDate)

        try container.encode(vInstCompName, forKey: .vInstCompName)
        try container.encode(instCompEmail, forKey: .instCompEmail)

        try container.encode(pInstCompName, forKey: .pInstCompName)
        try container.encode(address, forKey: .address)
        try container.encode(city, forKey: .city)
        try container.encode(state, forKey: .state)
        try container.encode(zipCode, forKey: .zipCode)
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        fullName = try container.decode(String.self, forKey: .fullName)
        classYear = try container.decode(String.self, forKey: .classYear)
        emailAddress = try container.decode(String.self, forKey: .emailAddress)
        needDate = try container.decode(String.self, forKey: .needDate)

        vInstCompName = try container.decode(String.self, forKey: .vInstCompName)
        instCompEmail = try container.decode(String.self, forKey: .instCompEmail)

        pInstCompName = try container.decode(String.self, forKey: .pInstCompName)
        address = try container.decode(String.self, forKey: .address)
        city = try container.decode(String.self, forKey: .city)
        state = try container.decode(String.self, forKey: .state)
        zipCode = try container.decode(String.self, forKey: .zipCode)
    }

    init() { }

    var didChange = PassthroughSubject<Void, Never>()

    //Personal Information
    @Published var fullName = "" { didSet { update() } }
    @Published var classYear = "" { didSet { update() } }
    @Published var emailAddress = "" { didSet { update() } }
    @Published var needDate = "" { didSet { update() } }

    //Digital Copy
    @Published var vInstCompName = "" { didSet { update() } }
    @Published var instCompEmail = "" { didSet { update() } }

    //Physical Copy
    @Published var pInstCompName = "" { didSet { update() } }
    @Published var address = "" { didSet { update() } }
    @Published var city = "" { didSet { update() } }
    @Published var state = "" { didSet { update() } }
    @Published var zipCode = "" { didSet { update() } }

    func update() {
        didChange.send(())
    }
}

class sendUpdate: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case firstName, lastName, classYear, emailAddress, phoneNumber, streetAddress, city, state, zipCode, employer, jobTitle, instName, degree, gradDate, eventNote
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(classYear, forKey: .classYear)
        try container.encode(emailAddress, forKey: .emailAddress)
        try container.encode(phoneNumber, forKey: .phoneNumber)


        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(state, forKey: .state)
        try container.encode(zipCode, forKey: .zipCode)

        try container.encode(employer, forKey: .employer)
        try container.encode(jobTitle, forKey: .jobTitle)

        try container.encode(instName, forKey: .instName)
        try container.encode(degree, forKey: .degree)
        try container.encode(gradDate, forKey: .gradDate)

        try container.encode(eventNote, forKey: .eventNote)
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        classYear = try container.decode(String.self, forKey: .classYear)
        emailAddress = try container.decode(String.self, forKey: .emailAddress)
        phoneNumber = try container.decode(String.self, forKey: .phoneNumber)

        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        state = try container.decode(String.self, forKey: .state)
        zipCode = try container.decode(String.self, forKey: .zipCode)

        employer = try container.decode(String.self, forKey: .employer)
        jobTitle = try container.decode(String.self, forKey: .jobTitle)

        instName = try container.decode(String.self, forKey: .instName)
        degree = try container.decode(String.self, forKey: .degree)
        gradDate = try container.decode(String.self, forKey: .gradDate)

        eventNote = try container.decode(String.self, forKey: .eventNote)
    }

    init() { }

    var didChange = PassthroughSubject<Void, Never>()
    //Personal Information
    @Published var firstName = "" { didSet { update() } }
    @Published var lastName = "" { didSet { update() } }
    @Published var classYear = "" { didSet { update() } }
    @Published var emailAddress = "" { didSet { update() } }
    @Published var phoneNumber = "" { didSet { update() } }

    //Mailing Address Information
    @Published var streetAddress = "" { didSet { update() } }
    @Published var city = "" { didSet { update() } }
    @Published var state = "" { didSet { update() } }
    @Published var zipCode = "" { didSet { update() } }
    //Career Information
    @Published var employer = "" { didSet { update() } }
    @Published var jobTitle = "" { didSet { update() } }

    //Graduation Information
    @Published var instName = "" { didSet { update() } }
    @Published var degree = "" { didSet { update() } }
    @Published var gradDate = "" { didSet { update() } }

    //Life Event
    @Published var eventNote = "" { didSet { update() } }

    func update() {
        didChange.send(())
    }
}

struct ContentView: View {
    
    //Pulling in Data from three endpoints
    @ObservedObject var list = getData()
    @ObservedObject var list1 = getData1()
    @ObservedObject var list2 = getData2()
    
    //Form classes
    @ObservedObject var update = requestTranscript()
    @ObservedObject var update2 = sendUpdate()
    
    @State var showingConfirmation = false
    @State var showingConfirmation1 = false

    //Segmented Picker Options for Form View
    @State private var selectedForm = 0
    @State private var forms = ["Update Your Info", "Request Transcript"]

    //Toggles for Second Form
    @State private var showMailing = false
    @State private var showCareer = false
    @State private var showGrad = false
    @State private var showGenUpdate = false

    //Segmented Picker Options for Transcript Request
    @State private var selectedTranscript = 0
    @State private var transcript = ["Digital", "Physical"]
    
    //SearchBar String for my three different views
    @State private var searchText : String = ""
    @State private var searchText1 : String = ""
    @State private var searchText2 : String = ""

    //Mail Variables
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    @State var alertNoMail = false
    
    //Tag Colors
    static let colors: [String: Color] = ["Full-Time": .yellow, "Part-Time": .blue, "Internship": .red, "Networking": .purple, "Professional Development": .green, "Career Fair": .orange]
    static let colors1: [String: Color] = ["College Visit": .blue, "DBCR": .yellow, "Volunteer": .green, "Professional Development": .red, "Religious": .orange]
    static let colors2: [String: Color] = ["Academic": .blue, "Financial Aid": .green, "DBCR": .yellow, "Newsletter": .gray, "Alumni Spotlight": .orange, "General": .black]
    
    init() {
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
        
  //      UITableView.appearance().allowsSelection = false
     //   UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        TabView {
            NavigationView {
                List(){
                    
                    SearchBar(text: $searchText)
                    
                    ForEach(list2.datas2.reversed().filter({ self.searchText.isEmpty ? true : $0.name.lowercased().contains(searchText.lowercased())})) { i in
                    NavigationLink(destination:
                    webView(url: i.website)
                        .navigationBarTitle("", displayMode: .inline)){
                          
                                VStack(alignment: .leading){
 
                                    Text(i.date)
                                    .font(.system(size:10))
                                
                                    Spacer()
                                    Text(i.name)
                                        .font(.system(size:16, weight: .bold))
                                    Spacer()
                                    HStack(){
                                        Text(i.description)
                                            .font(.subheadline)
                                            .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                                        
                                        Spacer()
                                        
                                        Text(i.tag)
                                            .font(.system(size:10, weight: .bold))
                                            .padding(4)
                                            .background(Self.colors2[i.tag, default:.black])
                                            .foregroundColor(.white)
                                            .cornerRadius(5)
                                    }.fixedSize(horizontal: false, vertical: true)
                            
                                }.padding(.vertical, 15)
                    
                    }.padding(.vertical, 15)
                    .padding(.horizontal, 10)
                    .background(Color(UIColor.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius:10, style:.continuous))
                    .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.2), radius: 5, y: 2)
                    
                    
                }.padding(.vertical, 2)
                
                
                    
                }.navigationBarTitle("Posts")
            
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                    Image(systemName: "doc.append")
                    Text("Resources")
            }.tag(0)
            
            NavigationView {
                List(){
                    SearchBar(text: $searchText1)
                    ForEach(list.datas.reversed().filter({ self.searchText1.isEmpty ? true : $0.company.lowercased().contains(searchText1.lowercased())})) { i in
                    NavigationLink(destination:
                        webView(url: i.website)
                            .navigationBarTitle("", displayMode: .inline)){
                                VStack(alignment: .leading){
                                    Text(i.date)
                                    .font(.system(size:10))
                                
                                    Spacer()
                                    Text(i.company)
                                        .font(.system(size:16, weight: .bold))
                                    Spacer()
                                    HStack(){
                                        Text(i.title)
                                            .font(.subheadline)
                                            .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                                        
                                        Spacer()
                                        
                                        Text(i.tag)
                                            .font(.system(size:10, weight: .bold))
                                            .padding(4)
                                            .background(Self.colors[i.tag, default:.black])
                                            .foregroundColor(.white)
                                            .cornerRadius(5)
                                    }.fixedSize(horizontal: false, vertical: true)
                            
                                }.padding(.vertical, 15)
                            }.padding(.vertical, 15)
                            .padding(.horizontal, 10)
                            .background(Color(UIColor.systemGray6))
                            .clipShape(RoundedRectangle(cornerRadius:10, style:.continuous))
                            .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.2), radius: 5, y: 2)
                    }.padding(.vertical, 2)
                }.navigationBarTitle("Career Opportunities")
                


            }
             .navigationViewStyle(StackNavigationViewStyle())
             .tabItem {
                Image(systemName: "briefcase")
                Text("Career")
             }
             .tag(1)
            
            NavigationView {
                List(){
                    SearchBar(text: $searchText2)
                    ForEach(list1.datas1.reversed().filter({ self.searchText2.isEmpty ? true : $0.name.lowercased().contains(searchText2.lowercased())})) { i in
                    NavigationLink(destination:
                        webView(url: i.website)
                            .navigationBarTitle("", displayMode: .inline)){
                                WebImage(url: URL(string: i.image)!, options: .highPriority, context: nil)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:70, height:70)
                                .cornerRadius(5)
                                .padding(.trailing, 4)
                                
                                VStack(alignment: .leading){
                                    
                                    Text(i.date)
                                    .font(.system(size:10))
                                    
                                    Text(i.name)
                                        .font(.system(size:16, weight: .bold))
                                    
                                    HStack(){
                                        Text(i.description)
                                            .font(.subheadline)
                                        .lineLimit(2)
                                            .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                                        
                                        Spacer()
                                        
                                        Text(i.tag)
                                            .font(.system(size:10, weight: .bold))
                                            .padding(4)
                                            .background(Self.colors1[i.tag, default:.black])
                                            .foregroundColor(.white)
                                            .cornerRadius(5)
                                    }.fixedSize(horizontal: false, vertical: true)
                            
                                }.padding(.vertical, 15)
                        }.padding(.vertical, 15)
                        .padding(.horizontal, 10)
                        .background(Color(UIColor.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius:10, style:.continuous))
                        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.2), radius: 5, y: 2)
                    }.padding(.vertical, 2)
                }.navigationBarTitle("Events")
                


            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Image(systemName: "calendar")
                Text("Events")
            }.tag(2)
            
            NavigationView {
                Form {
                    Picker(selection: $selectedForm, label: Text("")) {
                        ForEach(0 ..< forms.count) {       Text(self.forms[$0]).tag($0)
                        }
                    }.pickerStyle(SegmentedPickerStyle())

                    if selectedForm == 0 {
                        Toggle(isOn: $showMailing) {
                            Text("Include Mailing Address Update")
                        }
                        Toggle(isOn: $showGrad) {
                            Text("Include Graduation Update")
                        }
                        Toggle(isOn: $showCareer) {
                            Text("Include Career Update")
                        }
                        Toggle(isOn: $showGenUpdate) {
                            Text("Include Life Update")
                        }

                        Section(header: Text("Personal Information")){
                            TextField("First Name", text: $update2.firstName)
                            TextField("Last Name", text: $update2.lastName)
                            TextField("Class Year (ex. 2014)", text: $update2.classYear)
                            TextField("Email Address", text: $update2.emailAddress)
                            TextField("Phone Number", text: $update2.phoneNumber)
                        }
                        if showMailing {
                            Section(header: Text("Mailing Address")){
                                TextField("Street Address", text: $update2.streetAddress)
                                TextField("City", text: $update2.city)
                                TextField("State", text: $update2.state)
                                TextField("Zip Code", text: $update2.zipCode)
                            }
                        }
                        if showGrad {
                            Section(header: Text("Graduation Information")){
                                TextField("Institution Name", text: $update2.instName)
                                TextField("Degree", text: $update2.degree)
                                TextField("Graduation Date", text: $update2.gradDate)

                            }
                        }
                        if showCareer {
                            Section(header: Text("Career Information")){
                                TextField("Employer", text: $update2.employer)
                                TextField("Job Title", text: $update2.jobTitle)
                            }
                        }
                        if showGenUpdate {
                            Section(header: Text("Life Event")){
                                TextField("Specific (ex. Baby, Marriage, etc.)", text: $update2.eventNote)
                            }
                        }

                        Section {
                            Button(action: {
                                self.sendInfoUpdate()
                            }) {
                                Text("Send Update")
                            }.alert(isPresented: $showingConfirmation1) {
                                Alert(title: Text("Thank you for updating us!"), message: Text("Your info has been sent to the Alumni Outreach Coordinator"))
                            }
                        }
                    }
                    else if selectedForm == 1 {
                        Section(header: Text("Personal Information")) {
                            TextField("Full Name", text: $update.fullName)
                            TextField("Class Year (ex. 2014)", text: $update.classYear)
                            TextField("Email Address", text: $update.emailAddress)
                            TextField("Date Needed By (ex. 5/29/2014)", text: $update.needDate)
                        }

                        Picker(selection: $selectedTranscript, label: Text("Transcript Type")) {
                            ForEach(0 ..< transcript.count) { Text(self.transcript[$0]).tag($0)
                            }
                        }

                        if selectedTranscript == 0 {
                            Section(header: Text("For Digital Transcript")) {
                                TextField("Institution/Company Name", text: $update.vInstCompName)
                                TextField("Institution/Company Email", text: $update.instCompEmail)
                            }
                        } else if selectedTranscript == 1 {
                            Section(header: Text("For Physical Transcript")) {
                                TextField("Institution/Company Name", text: $update.pInstCompName)
                                TextField("Street Address", text: $update.address)
                                TextField("City", text: $update.city)
                                TextField("State", text: $update.state)
                                TextField("Zip", text: $update.zipCode)
                                }
                        }
                        Section {
                            Button("Send Request") {
                                self.sendTranscriptRequest()
                            }.alert(isPresented: $showingConfirmation) {
                                Alert(title: Text("Thank you!"), message: Text("Your Transcript Request has been sent to the Alumni Outreach Coordinator"))
                            }
                        }
                    }

                }.navigationBarTitle("Forms")

            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Image(systemName: "pencil.and.ellipsis.rectangle")
                Text("Forms")
            }.tag(3)
           
//            NavigationView {
//                Form {
//                    ZStack{
//                        VStack{
//
//                            Button(action: {
//                                self.isShowingMailView.toggle()
//                            }) {
//                                Text("Contact your Alumni Outreach Coordinator")
//                            }
//                            .onTapGesture {
//                                MFMailComposeViewController.canSendMail() ? self.isShowingMailView.toggle() : self.alertNoMail.toggle()
//                            }
//                            .sheet(isPresented: $isShowingMailView) {
//                                MailView(result: self.$result)
//                            }
//                            .alert(isPresented: self.$alertNoMail) {
//                                Alert(title: Text("Please set up mail account in order to send email."), message: Text("Settings > Passwords & Accounts"))
//                            }
//                        }
//                    }
//                }.navigationBarTitle("Settings")
//            }
//            .navigationViewStyle(StackNavigationViewStyle())
//            .tabItem {
//                Image(systemName: "gear")
//                Text("Settings")
//            }.tag(4)
            
        }.accentColor(.yellow)
    }
    
    func sendTranscriptRequest() {
        guard let encoded = try? JSONEncoder().encode(update) else {
            print("Failed to encode update")
            return
        }

        let url = URL(string: "https://dbcrapi.herokuapp.com/api/requests/v1/")!

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        request.httpBody = encoded
    

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
               print("Error took place \(error)")
               return
           }
    
           // Convert HTTP Response Data to a String
           if let data = data, let dataString = String(data: data, encoding: .utf8) {
               print("Response data string:\n \(dataString)")
           }
            
            self.showingConfirmation = true
        }.resume()
    }
    
    func sendInfoUpdate() {
        guard let encoded = try? JSONEncoder().encode(update2) else {
            print("Failed to encode update")
            return
        }

        let url = URL(string: "https://dbcrapi.herokuapp.com/api/infoupdates/v1/")!

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        request.httpBody = encoded
    

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
               print("Error took place \(error)")
               return
           }
    
           // Convert HTTP Response Data to a String
           if let data = data, let dataString = String(data: data, encoding: .utf8) {
               print("Response data string:\n \(dataString)")
           }
            
            self.showingConfirmation1 = true
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct dataType : Identifiable {
    let id = UUID()
    var company : String
    var title : String
    var tag : String
    var date : String
    var website : String
}

class getData : ObservableObject {
    @Published var datas = [dataType]()
    init() {
        let source = "https://dbcrapi.herokuapp.com/api/jobs/v1"
        
        let url = URL(string: source)!
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { (data, _, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
        
            let json = try! JSON(data: data!)
            for i in json["results"]{
                let company = i.1["company"].stringValue
                let title = i.1["title"].stringValue
                let tag = i.1["tag"].stringValue
                let website = i.1["website"].stringValue
                let date = i.1["posted_at"].stringValue
                
                DispatchQueue.main.async {
                    self.datas.append(dataType(company: company, title: title, tag: tag, date: date, website: website))
                }
            }
        }.resume()
    }
}

struct dataType1 : Identifiable {
    let id = UUID()
    var name : String
    var description : String
    var tag : String
    var website : String
    var date : String
    var image : String
}

class getData1 : ObservableObject {
    @Published var datas1 = [dataType1]()
    init() {
        let source = "https://dbcrapi.herokuapp.com/api/events/v1"
        
        let url = URL(string: source)!
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { (data, _, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
        
            let json = try! JSON(data: data!)
            for i in json["results"]{
                let image = i.1["image"].stringValue
                let name = i.1["name"].stringValue
                let description = i.1["description"].stringValue
                let tag = i.1["tag"].stringValue
                let website = i.1["website"].stringValue
                let date = i.1["event_date"].stringValue
                DispatchQueue.main.async {
                    self.datas1.append(dataType1(name: name, description: description, tag: tag, website: website, date: date, image: image))
                }
            }
        }.resume()
    }
}

struct dataType2 : Identifiable {
    let id = UUID()
    var name : String
    var description : String
    var tag : String
    var date : String
    var website : String
}

class getData2 : ObservableObject {
    @Published var datas2 = [dataType2]()
    init() {
        let source = "https://dbcrapi.herokuapp.com/api/articles/v1"
        
        let url = URL(string: source)!
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { (data, _, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
        
            let json = try! JSON(data: data!)
            for i in json["results"]{
                let name = i.1["name"].stringValue
                let description = i.1["description"].stringValue
                let tag = i.1["tag"].stringValue
                let website = i.1["website"].stringValue
                let date = i.1["post_date"].stringValue
                DispatchQueue.main.async {
                    self.datas2.append(dataType2(name: name, description: description, tag: tag, date: date, website: website))
                }
            }
        }.resume()
    }
}

struct webView : UIViewRepresentable {
    var url : String
    func makeUIView(context: UIViewRepresentableContext<webView>) -> WKWebView {
        let view =  WKWebView()
        view.load(URLRequest(url: URL(string: url)!))
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<webView>) {
        
    }
}

struct MailView: UIViewControllerRepresentable {

    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {

        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?

        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _presentation = presentation
            _result = result
        }

        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            defer {
                $presentation.wrappedValue.dismiss()
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(presentation: presentation,
                           result: $result)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.setToRecipients(["ccastillo@dbcr.org"])
        vc.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
        vc.mailComposeDelegate = context.coordinator
        return vc
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {

    }
}
