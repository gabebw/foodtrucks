class PrettyNamePrinter
  MENU_URLS = {
    "Bon Me" => "http://www.bonmetruck.com/menu/",
    "Cookie Monstah" => "http://thecookiemonstah.com/ox_portfolio/portfolio/",
    "Evan's NY Style Deli" => "http://www.evansnewyorkstyledeli.com/our-food-truck/food-truck-menu/",
    "Mei Mei Street Kitchen" => "http://meimeiboston.tumblr.com/",
    "Meng's Kitchen" => 'http://www.yelp.com/biz/mengs-kitchen-boston?hrid=KCvaa0cLk5nWAARnQUNdww',
    "Momogoose" => "http://sategrill.com/cafe-menu/",
    "Moyzilla" => "http://boston.menupages.com/restaurants/moyzilla/menu",
    "Paris Creperie" => "http://pariscreperie.com/la-tour-eiffel-bostons-very-first-crepe-truck/",
    "Roxy's Gourmet Grilled Cheese" => 'http://www.roxysgrilledcheese.com/menu/',
    "Stoked Wood Fired Pizza Co." => "http://www.stokedpizzaco.com/menu",
    "Tenoch Mexican" => "http://www.tenochmexican.com/menu/",
    "The Dining Car" => "http://diningcar.net/menu/",
  }

  TWITTER_NAMES = {
    "Baja Taco Truck" => "BajaTacoTruck",
    "Chubby Chickpea" => "chubbyfoodtruck",
    "Bon Me" => "bonme",
    "Chicken & Rice Guys" => "CnRG_Boston",
    "Cookie Monstah" => "MonstahTruck",
    "Mei Mei Street Kitchen" => "meimeiboston",
    "Momogoose" => "momogoose",
    "Moyzilla" => "MoyzillaTruck",
    "Paris Creperie" => "ParisCreperie",
    "Roxy's Gourmet Grilled Cheese" => "RoxysGrilledChz",
    "Stoked Wood Fired Pizza Co." => "StokedPizza",
    "Tenoch Mexican" => "TenochMexican",
    "The Dining Car" => "thediningcar",
  }

  def initialize(name)
    @name = name
  end

  def name_with_menu
    if MENU_URLS.key?(@name)
      %{<a href="#{MENU_URLS[@name]}">#{@name}</a>}
    else
      @name
    end
  end

  def twitter_link
    if TWITTER_NAMES.key?(@name)
      %{ <a href="https://twitter.com/#{TWITTER_NAMES[@name]}"><i class="icon-twitter-bird"></i></a>}
    else
      ''
    end
  end
end
