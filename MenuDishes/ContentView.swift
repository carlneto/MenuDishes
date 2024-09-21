import SwiftUI

struct ContentView: View {
   @State private var searchText = ""
   let dishes = data.sorted(by: { $0.name < $1.name })
   
   var filteredDishes: [Dish] {
      if searchText.isEmpty {
         return dishes
      } else {
         let searchWords = searchText.searchable.split(separator: " ")
         return dishes.filter { dish in
            let dishText = "\(dish.name) \(dish.description) \(dish.ingredients.joined(separator: " "))".searchable
            return searchWords.allSatisfy { dishText.contains($0) }
         }
      }
   }
   
   var body: some View {
      NavigationView {
         List(filteredDishes) { dish in
            NavigationLink(destination: DishDetailView(dish: dish)) {
               VStack(alignment: .leading) {
                  Text(dish.name)
                     .font(.headline)
                     .padding(.bottom, 5)
                  
                  if let firstImage = dish.images.first {
                     Image(firstImage)
                        .resizable()
                        .frame(height: 200)
                        .frame(maxWidth: .infinity, alignment: .leading)
                  }
               }
               .padding(.vertical, 10)
            }
         }
         .navigationTitle("Ementa")
         .searchable(text: $searchText, prompt: "Pesquisar por nome ou ingredientes")
      }
   }
}

extension String {
   var searchable: String {
      self.specialCharsCleanned.lowercased()
   }
   var specialCharsCleanned: String {
      let txt = self
      let allwedChars = Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ")
      let ret = txt.folding(options: .diacriticInsensitive, locale: .current)
      let result = ret.filter { allwedChars.contains($0) }
      return result
   }
}

struct DishDetailView: View {
   var dish: Dish
   
   var body: some View {
      ScrollView {
         VStack(alignment: .leading) {
            ForEach(dish.images, id: \.self) { imageName in
               Image(imageName)
                  .resizable()
                  .scaledToFit()
                  .frame(height: 200)
                  .cornerRadius(10)
                  .padding(.bottom, 10)
            }
            
            Text(dish.description)
               .font(.body)
               .padding(.bottom, 10)
            
            Text("Ingredientes")
               .font(.headline)
            
            ForEach(dish.ingredients, id: \.self) { ingredient in
               Text(ingredient)
                  .padding(.leading, 10)
            }
            
            Spacer()
         }
         .padding()
      }
      .navigationTitle(dish.name)
   }
}

struct Dish: Identifiable {
   var id = UUID()
   var name: String
   var description: String
   var ingredients: [String]
   var images: [String]
}

let data: [Dish] = [
   Dish(
      name: "Vepřo knedlo zelo",
      description: "Prato nacional checo composto por carne de porco assada, knedlíky e couve fermentada.",
      ingredients: ["Carne de porco", "Knedlíky", "Couve fermentada", "Cebola", "Alho", "Cominho"],
      images: ["Vepro-knedlo-zelo"]
   ),
   Dish(
      name: "Svíčková na smetaně",
      description: "Lombo de vaca em molho de natas com cenoura, servido com knedlíky.",
      ingredients: ["Lombo de vaca", "Natas", "Cenoura", "Aipo", "Salsa", "Knedlíky"],
      images: ["Svickova-na-smetane"]
   ),
   Dish(
      name: "Guláš",
      description: "Ensopado de carne picante, servido com knedlíky ou pão.",
      ingredients: ["Carne de vaca", "Cebola", "Pimentão", "Alho", "Páprica", "Cominho"],
      images: ["Goulash-tcheco"]
   ),
   Dish(
      name: "Smažený sýr",
      description: "Queijo frito, geralmente servido com batatas fritas e molho tártaro.",
      ingredients: ["Queijo Edam", "Ovo", "Farinha", "Pão ralado", "Óleo para fritar"],
      images: ["insider-praga-queijo-frito-fried-cheese"]
   ),
   Dish(
      name: "Bramboráky",
      description: "Panquecas de batata fritas, temperadas com alho e manjerona.",
      ingredients: ["Batata ralada", "Farinha", "Ovo", "Alho", "Manjerona", "Sal"],
      images: ["6308_superapetite-1-10-09-24-jpg"]
   ),
   Dish(
      name: "Knedlíky",
      description: "Bolinhos de pão cozidos a vapor, servidos como acompanhamento.",
      ingredients: ["Farinha", "Leite", "Ovo", "Fermento", "Sal"],
      images: ["BORUVKOVE-KNEDLIKY"]
   ),
   Dish(
      name: "Řízek",
      description: "Bife panado, geralmente de porco ou frango, similar ao schnitzel austríaco.",
      ingredients: ["Carne de porco ou frango", "Ovo", "Farinha", "Pão ralado", "Óleo para fritar"],
      images: ["rizek-checo-130386241"]
   ),
   Dish(
      name: "Smažený kapr",
      description: "Carpa frita, prato tradicional de Natal na República Checa.",
      ingredients: ["Carpa", "Farinha", "Ovo", "Pão ralado", "Limão", "Sal"],
      images: ["ccae30a0a2391b85094a686ebd998eee"]
   ),
   Dish(
      name: "Koleno",
      description: "Joelho de porco assado, servido com rábano picante e mostarda.",
      ingredients: ["Joelho de porco", "Alho", "Cominho", "Cerveja", "Rábano picante", "Mostarda"],
      images: ["koleno"]
   ),
   Dish(
      name: "Svíčková omáčka",
      description: "Molho cremoso de legumes para acompanhar carne assada.",
      ingredients: ["Cenoura", "Aipo", "Salsa", "Natas", "Especiarias", "Sumo de limão"],
      images: ["svickova-omacka-na-smetane-213917-677-508-nw"]
   ),
   Dish(
      name: "Houskový knedlík",
      description: "Knedlíky feitos com pão, servidos como acompanhamento.",
      ingredients: ["Pão seco", "Leite", "Ovo", "Fermento", "Sal"],
      images: ["c2f646b2a9a6b54cba6d916316e17abe-facebook"]
   ),
   Dish(
      name: "Zelňačka",
      description: "Sopa de couve fermentada com batata e linguiça.",
      ingredients: ["Couve fermentada", "Batata", "Linguiça", "Cebola", "Natas", "Páprica"],
      images: ["50011f53c7f2441981668f9b22918443"]
   ),
   Dish(
      name: "Česnečka",
      description: "Sopa de alho cremosa, por vezes servida com croutons e queijo.",
      ingredients: ["Alho", "Batata", "Caldo de carne", "Ovo", "Croutons", "Queijo"],
      images: ["360_F_313319491_oNyMgfzSk9YMrBUnqQ16zSinX81WAqjp"]
   ),
   Dish(
      name: "Kulajda",
      description: "Sopa cremosa com cogumelos, batata e ovo escalfado.",
      ingredients: ["Cogumelos", "Batata", "Natas", "Endro", "Ovo", "Vinagre"],
      images: ["Kulajda"]
   ),
   Dish(
      name: "Sekaná",
      description: "Rolo de carne picada assada, similar ao rolo de carne.",
      ingredients: ["Carne picada", "Cebola", "Alho", "Pão ralado", "Ovo", "Especiarias"],
      images: ["ffeb954ec5888bdc7ee597d8efd0f910"]
   ),
   Dish(
      name: "Utopenci",
      description: "Salsichas marinadas em vinagre com cebola e pimentão.",
      ingredients: ["Salsichas", "Cebola", "Pimentão", "Vinagre", "Pimenta", "Louro"],
      images: ["h389w574t"]
   ),
   Dish(
      name: "Tatarák",
      description: "Carne de vaca crua picada, temperada e servida com torradas.",
      ingredients: ["Carne de vaca crua", "Cebola", "Ovo de codorniz", "Mostarda", "Molho inglês", "Páprica"],
      images: ["Tatarak"]
   ),
   Dish(
      name: "Ovocné knedlíky",
      description: "Bolinhos doces recheados com fruta, polvilhados com açúcar e manteiga.",
      ingredients: ["Massa de batata", "Fruta (ameixa ou morango)", "Açúcar em pó", "Manteiga derretida"],
      images: ["ovocne_knedliky_3833-reg"]
   ),
   Dish(
      name: "Koprová omáčka",
      description: "Molho cremoso de endro, servido com ovos cozidos e knedlíky.",
      ingredients: ["Endro", "Natas", "Farinha", "Caldo de legumes", "Ovos cozidos", "Knedlíky"],
      images: ["20200526_171652b"]
   ),
   Dish(
      name: "Španělský ptáček",
      description: "Rolo de carne de vaca recheado com ovo, salsicha e picles.",
      ingredients: ["Carne de vaca", "Ovo cozido", "Salsicha", "Picles", "Bacon", "Mostarda"],
      images: ["hospodsky-spanelsky-ptacek-podle"]
   ),
   Dish(
      name: "Cmunda",
      description: "Panqueca de batata frita com carne de porco assada por cima.",
      ingredients: ["Batata ralada", "Carne de porco", "Cebola", "Alho", "Manjerona", "Banha"],
      images: ["JVE86ecf5_35341_102698599"]
   ),
   Dish(
      name: "Moravský vrabec",
      description: "Pedaços de carne de porco assados com alho e cominho.",
      ingredients: ["Carne de porco", "Alho", "Cominho", "Cebola", "Banha", "Sal"],
      images: ["JVE86e34b_25001_101229344"]
   ),
   Dish(
      name: "Svíčková na smetaně",
      description: "Lombo de vaca em molho cremoso de legumes, servido com knedlíky.",
      ingredients: ["Lombo de vaca", "Cenoura", "Aipo", "Salsa", "Natas", "Knedlíky"],
      images: ["svickova_na_smetane"]
   ),
   Dish(
      name: "Halušky",
      description: "Pequenos nhoques de batata, muitas vezes servidos com queijo e bacon.",
      ingredients: ["Batata", "Farinha", "Queijo", "Bacon", "Cebola", "Natas"],
      images: ["Bryndzove_halusky_so_slaninou"]
   ),
   Dish(
      name: "Pivní sýr",
      description: "Queijo marinado em cerveja e especiarias, servido como aperitivo.",
      ingredients: ["Queijo Olomoucké tvarůžky", "Cerveja", "Cebola", "Páprica", "Cominho", "Pimenta"],
      images: ["h389w574t_"]
   ),
   Dish(
      name: "Buřty na pivu",
      description: "Salsichas cozidas em cerveja com cebola e pimentão.",
      ingredients: ["Salsichas", "Cerveja", "Cebola", "Pimentão", "Pimenta", "Mostarda"],
      images: ["1-728-23-beautyshot-1132x637-Burty-na-pivu-z-kotliku"]
   ),
   Dish(
      name: "Topinky",
      description: "Fatias de pão fritas em gordura, esfregadas com alho.",
      ingredients: ["Pão de centeio", "Banha", "Alho", "Sal"],
      images: ["topinky-with-garlic-high-res"]
   ),
   Dish(
      name: "Uzené",
      description: "Carne de porco fumada, geralmente servida com knedlíky e espinafres.",
      ingredients: ["Carne de porco fumada", "Knedlíky", "Espinafres", "Alho"],
      images: ["image-1-1024x576"]
   ),
   Dish(
      name: "Bramborový salát",
      description: "Salada de batata, prato tradicional de Natal.",
      ingredients: ["Batata", "Cenoura", "Ervilhas", "Cebola", "Maionese", "Picles"],
      images: ["d2d5ad08f75329d2f66a55dfe22b4d32"]
   ),
   Dish(
      name: "Zabijačkový guláš",
      description: "Gulache feito com miudezas de porco, servido durante a matança do porco.",
      ingredients: ["Miudezas de porco", "Cebola", "Alho", "Páprica", "Pimentão", "Cominho"],
      images: ["4F0BB120-B199-4751-BA06-C1C7FECC89AB"]
   ),
   Dish(
      name: "Vepřové výpečky",
      description: "Pedaços de carne de porco assados até ficarem crocantes.",
      ingredients: ["Carne de porco", "Alho", "Cominho", "Cebola", "Cerveja", "Sal"],
      images: ["veprove-vypecky-ii-249976-677-508-nw"]
   ),
   Dish(
      name: "Hovězí na česneku",
      description: "Carne de vaca cozida lentamente com muito alho.",
      ingredients: ["Carne de vaca", "Alho", "Cebola", "Pimentão", "Tomate", "Especiarias"],
      images: ["maxresdefault"]
   ),
   Dish(
      name: "Drštková polévka",
      description: "Sopa de tripas picante, popular como cura para a ressaca.",
      ingredients: ["Tripas", "Batata", "Cebola", "Alho", "Páprica", "Manjerona"],
      images: ["6fe118c90f22001ab05480d24ad322b2-facebook"]
   ),
   Dish(
      name: "Telecí řízek",
      description: "Escalope de vitela panado, servido com salada de batata.",
      ingredients: ["Vitela", "Ovo", "Farinha", "Pão ralado", "Óleo", "Limão"],
      images: ["Escalopes-de-vitela-panados"]
   ),
   Dish(
      name: "Pečená kachna",
      description: "Pato assado, geralmente servido com knedlíky e couve roxa.",
      ingredients: ["Pato", "Maçã", "Cebola", "Alho", "Manjerona", "Cominho"],
      images: ["peccc8cenacc81-kachna-knedlicky-and-red-cabbage-1"]
   ),
   Dish(
      name: "Vepřová pečeně",
      description: "Carne de porco assada, geralmente servida com knedlíky e couve fermentada.",
      ingredients: ["Lombo de porco", "Alho", "Cominho", "Sal", "Pimenta", "Cebola"],
      images: ["Czech-food-culture-couve"]
   ),
   Dish(
      name: "Nakládaný hermelín",
      description: "Queijo Camembert marinado em azeite com especiarias e pimentos, servido como aperitivo.",
      ingredients: ["Queijo Camembert", "Azeite", "Cebola", "Pimentão", "Alho", "Pimenta em grão"],
      images: ["Marynowany-hermelin"]
   ),
   Dish(
      name: "Marinovaná vepřová",
      description: "Carne de porco marinada em especiarias e ervas, depois grelhada ou assada.",
      ingredients: ["Carne de porco", "Alho", "Cebola", "Páprica", "Cominho", "Tomilho"],
      images: ["spare-ribs-7410914_1280"]
   ),
   Dish(
      name: "Vepřová žebra",
      description: "Costeletas de porco assadas, muitas vezes marinadas em cerveja e especiarias.",
      ingredients: ["Costeletas de porco", "Cerveja", "Mel", "Alho", "Páprica", "Mostarda"],
      images: ["marinovana-a-pecena-veprova-zebirka_shutterstock_735515704"]
   ),
   Dish(
      name: "Domácí jablečný štrúdl",
      description: "Strudel de maçã caseiro, uma sobremesa popular feita com massa folhada e recheio de maçã.",
      ingredients: ["Massa folhada", "Maçãs", "Açúcar", "Canela", "Passas", "Nozes"],
      images: ["38fe3986-c7fd-4514-822f-a99efbfbe7dc"]
   ),
]
