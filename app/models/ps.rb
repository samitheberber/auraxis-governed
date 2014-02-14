module PS
  API_URL="http://census.soe.com/get/ps2:v2/"

  EXTRA_ITEMS=[
    "17", # camo
    "38", # Vehicle decoration
  ]

  class Character

    attr_reader :id, :name, :battle_rank, :aerospace, :infantry, :mechanized, :items

    def initialize(opts={})
      @id = opts["character_id"]
      @name = opts["name"]["first"]
      @battle_rank = opts["battle_rank"]["value"]
      @aerospace = opts["currency"]["aerospace"]
      @infantry = opts["currency"]["infantry"]
      @mechanized = opts["currency"]["mechanized"]
      @items = opts["items"].map{|i| Item.new(i)}.select{|i| !EXTRA_ITEMS.include?(i.type_id)}
    end
  end

  class Item

    attr_reader :id, :type_id, :name

    def initialize(opts={})
      @id = opts["item_id"]
      @type_id = opts["item_type_id"]
      @name = opts["name"]["en"]
    end
  end

  def self.get_characters_by_name(names)
    response = HTTParty.get "#{API_URL}/character_name/?#{names.map(&:downcase).map{|n| "name.first_lower=#{n}"}.join("&")}&c:show=character_id&c:limit=#{names.length}"
    get_characters_by_id response.parsed_response["character_name_list"].map{|c| c["character_id"]}
  end

  def self.get_characters_by_id(ids)
    response = HTTParty.get "#{API_URL}/character/?character_id=#{ids.join(",")}&c:resolve=currency,item_full"
    response.parsed_response["character_list"].map{|u| Character.new(u)}
  end
end
