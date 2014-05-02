module PS
  API_URL="http://census.soe.com/get/ps2:v2/"

  EXTRA_ITEMS=[
    "17", # camo
    "38", # Vehicle decoration
  ]

  class Character

    attr_reader :id, :name, :battle_rank, :aerospace, :infantry, :mechanized, :items, :online

    def initialize(opts={})
      @id = opts["character_id"]
      @name = opts["name"]["first"]
      @online = opts["online_status"] != "0"
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

  def self.get_character_id_by_name(name)
    response = HTTParty.get "#{API_URL}/character_name/?name.first_lower=#{name.downcase}&c:show=character_id"
    response.parsed_response["character_name_list"].first["character_id"]
  end

  def self.get_characters_by_name(names)
    get_characters_by_id get_character_ids_by_name(names)
  end

  def self.get_characters_by_ids(ids)
    response = HTTParty.get "#{API_URL}/character/?character_id=#{ids.join(",")}&c:resolve=currency,online_status,item_full"
    response.parsed_response["character_list"].map{|u| Character.new(u)}
  end

  def self.get_servers
    response = HTTParty.get "#{API_URL}/world/?c:limit=100"
    response.parsed_response["world_list"].map{|world| world["name"]["en"]}
  end
end
