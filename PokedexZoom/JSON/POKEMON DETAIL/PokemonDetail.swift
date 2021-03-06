/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct PokemonDetail : Codable {
	let abilities : [Abilities]?
	let base_experience : Int?
	let forms : [Forms]?
	let height : Int?
	let held_items : [String]?
	let id : Int?
	let is_default : Bool?
	let location_area_encounters : String?
	let moves : [Moves]?
	let name : String?
	let order : Int?
	let past_types : [String]?
	let species : Species?
	let sprites : Sprites?
	let stats : [Stats]?
	let types : [Types]?
	let weight : Int?

	enum CodingKeys: String, CodingKey {

		case abilities = "abilities"
		case base_experience = "base_experience"
		case forms = "forms" 
		case height = "height"
		case held_items = "held_items"
		case id = "id"
		case is_default = "is_default"
		case location_area_encounters = "location_area_encounters"
		case moves = "moves"
		case name = "name"
		case order = "order"
		case past_types = "past_types"
		case species = "species"
		case sprites = "sprites"
		case stats = "stats"
		case types = "types"
		case weight = "weight"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		abilities = try values.decodeIfPresent([Abilities].self, forKey: .abilities)
		base_experience = try values.decodeIfPresent(Int.self, forKey: .base_experience)
		forms = try values.decodeIfPresent([Forms].self, forKey: .forms)
		height = try values.decodeIfPresent(Int.self, forKey: .height)
		held_items = try values.decodeIfPresent([String].self, forKey: .held_items)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		is_default = try values.decodeIfPresent(Bool.self, forKey: .is_default)
		location_area_encounters = try values.decodeIfPresent(String.self, forKey: .location_area_encounters)
		moves = try values.decodeIfPresent([Moves].self, forKey: .moves)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		order = try values.decodeIfPresent(Int.self, forKey: .order)
		past_types = try values.decodeIfPresent([String].self, forKey: .past_types)
		species = try values.decodeIfPresent(Species.self, forKey: .species)
		sprites = try values.decodeIfPresent(Sprites.self, forKey: .sprites)
		stats = try values.decodeIfPresent([Stats].self, forKey: .stats)
		types = try values.decodeIfPresent([Types].self, forKey: .types)
		weight = try values.decodeIfPresent(Int.self, forKey: .weight)
	}
     
    init(){
        self.abilities = nil
        self.base_experience = nil
        self.forms = nil 
        self.height = nil
        self.held_items = nil
        self.id = nil
        self.is_default = nil
        self.location_area_encounters = nil
        self.moves = nil
        self.order = nil
        self.name = nil
        self.past_types = nil
        self.species = nil
        self.sprites = nil
        self.stats = nil
        self.types = nil
        self.weight = nil 
    }

}
