#提出済み　
require "pry"
class Plan
  attr_reader :place,:price 

  def initialize(place:,price:)

    @place = place
    @price = price

  end

end
  
class Seller
  attr_reader :catalog 
  attr_writer :estimate_cost
  def initialize(catalog)
    @catalog = catalog
  end

  def disp_catalog
    @catalog.each.with_index(1) do |plan,i| #menuはインスタンスそのもの
    puts "#{i}:#{plan.place}旅行 #{plan.price}円"
    end
  end

  def ask_plan
    puts "プラン番号を選択してしてください！"
    gets.to_i
  end

  def ask_person_num
    puts "人数の選択を選択してください！"
    gets.to_i
  end

  def create_estimate
     puts "見積金額は下記の通りになります！"
     puts "#{@estimate_cost}円"
  end
end

class Accout
   
  def initialize(catalog,plan_num,person_num)
    @catalog = catalog
    @plan_num = plan_num
    @person_num = person_num
  end

  def estimate_cost
    @catalog[@plan_num -1].price * @person_num
  end

end

  
  plan_1 = Plan.new(place: "沖縄", price: 10000)
  plan_2 = Plan.new(place: "北海道", price: 20000)
  catalog = [plan_1,plan_2]
 
  seller_1 = Seller.new(catalog)
  seller_1.disp_catalog
  plan_num = seller_1.ask_plan
  peson_num = seller_1.ask_person_num
  
  accounting = Accout.new(catalog,plan_num,peson_num)

  #accountで作った見積もり金額を、セラーに渡している
  seller_1.estimate_cost = accounting.estimate_cost 
  puts seller_1.create_estimate


  # binding.pry