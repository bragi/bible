class Book
  def initialize(book)
    @book = book
  end
  
  def books
    {
      "Gen" => "Księga Rodzaju (Gen)",
      "Ex" => "Księga Wyjścia (Ex)",
      "Lev" => "Księga Kapłańska",
      "Nu" => "Księga Liczb (Nu)",
      "Deu" => "Księga Powtórzonego Prawa",
      "Joz" => "Księga Jozuego (Joz)",
      "Sdz" => "Księga Sedziów (Sdz)",
      "Rut" => "Księga Rut (Rut)",
      "1Sam" => "1 Księga Samuela (1Sam)",
      "2Sam" => "2 Księga Samuela (2Sam)",
      "1Krl" => "1 Księga Królewska (1Krl)",
      "2Krl" => "2 Księga Królewska (2Krl)",
      "1Krn" => "1 Księga Kronik (1Krn)",
      "2Krn" => "2 Księga Kronik (2Krn)",
      "Ezd" => "Księga Ezdrasza (Ezd)",
      "Neh" => "Księga Nehemiasza (Neh)",
      "Tob" => "Księga Tobiasza (Tob)",
      "Jdt" => "Księga Judyty (Jdt)",
      "Est" => "Księga Estery (Est)",
      "1Mch" => "1 Machabejska (1Mach)",
      "2Mch" => "2 Machabejska (2Mach)",
      "Hi" => "Księga Hioba (Hi)",
      "Ps" => "Księga Psalmów (Ps)",
      "Prz" => "Księga Przysłów (Prz)",
      "Koh" => "Księga Koheleta (Koh)",
      "Pnp" => "Pieśń nad pieśniami (Pnp)",
      "Mdr" => "Księga Mądrości (Mdr)",
      "Syr" => "Mądrość Syracha (Syr)",
      "Iz" => "Księga Izajasza (Iz)",
      "Jer" => "Księga Jeremiasza (Jer)",
      "Lam" => "Lamentacje Jeremiasza (Lam)",
      "Bar" => "Księga Barucha (Bar)",
      "Ez" => "Księga Ezechiela (Ez)",
      "Dan" => "Księga Daniela (Dan)",
      "Oz" => "Księga Ozeasza (Oz)",
      "Joel" => "Księga Joela (Joel)",
      "Am" => "Księga Amosa (Am)",
      "Ab" => "Księga Abdiasza (Ab)",
      "Jon" => "Księga Jonasza (Jon)",
      "Mi" => "Księga Micheasza (Mi)",
      "Na" => "Księga Nahuma (Na)",
      "Hab" => "Księga Habakuka (Hab)",
      "Sof" => "Księga Sofoniasza (Sof)",
      "Ag" => "Księga Aggeusza (Ag)",
      "Zach" => "Księga Zachariasza (Zach)",
      "Mal" => "Księga Malachiasza (Mal)",
      "" => "---",
      "Mt" => "Ewangelia Mateusza (Mt)",
      "Mk" => "Ewangelia Marka (Mk)",
      "Luk" => "Ewangelia Łukasza (Lu)",
      "J" => "Ewangelia Jana (J)",
      "Dz" => "Dzieje Apostolskie (Dz)",
      "Rz" => "List do Rzymian (Rz)",
      "1Kor" => "1 List do Koryntian (1Kor)",
      "2Kor" => "2 List do Koryntian (2Kor)",
      "Ga" => "List do Galatów (Ga)",
      "Ef" => "List do Efezjan (Ef)",
      "Fil" => "List do Filipian (Fil)",
      "Kol" => "List do Kolosan (Kol)",
      "1Tes" => "1 List do Tesaloniczan (1Tes)",
      "2Tes" => "2 List do Tesaloniczan (2Tes)",
      "1Tym" => "1 List do Tymoteusza (1Tym)",
      "2Tym" => "2 List do Tymoteusza (2Tym)",
      "Tyt" => "List do Tytusa (Tyt)",
      "Flm" => "List do Filemona (Flm)",
      "Heb" => "List do Hebrajczyków (Heb)",
      "Jak" => "List Jakuba (Jak)",
      "1P" => "1 List Piotra (1P)",
      "2P" => "2 List Piotra (2P)",
      "1J" => "1 List Jana (1J)",
      "2J" => "2 List Jana (2J)",
      "3J" => "3 List Jana (3J)",
      "Jud" => "List Judy (Jud)",
      "Ap" => "Apokalipsa Św. Jana (Ap)"
    }
  end
  
  def options
    books.map { |value, text| Option.new(value, text, value==@book) }
  end
  
  class Option
   def initialize(value, text, selected)
     @value = value
     @text = text
     @selected = selected
   end
   
   attr_reader :text
   
   def attributes
     @selected ? {value: @value, selected: "selected"} : {value: @value}
   end
  end
end