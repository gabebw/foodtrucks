class PrettyNamePrinter
  PRETTY = {
    "Baja Taco Truck" => {
      twitter: "BajaTacoTruck"
    },
    "Bon Me" => {
      menu: "http://www.bonmetruck.com/menu/",
      twitter: "bonme"
    },
    "Chicken & Rice Guys" => {
      twitter: "CnRG_Boston",
    },
    "Chubby Chickpea" => {
      twitter: "chubbyfoodtruck",
    },
    "Cookie Monstah" => {
      menu: "http://thecookiemonstah.com/ox_portfolio/portfolio/",
      twitter: "MonstahTruck"
    },
    "Evan's NY Style Deli" => {
      menu: "http://www.evansnewyorkstyledeli.com/our-food-truck/food-truck-menu/",
    },
    "Mei Mei Street Kitchen" => {
      menu: "http://meimeiboston.tumblr.com/",
      twitter: "meimeiboston"
    },
    "Meng's Kitchen" => {
      menu: "http://www.yelp.com/biz/mengs-kitchen-boston?hrid=KCvaa0cLk5nWAARnQUNdww",
    },
    "Momogoose" => {
      menu: "http://sategrill.com/cafe-menu/",
      twitter: "momogoose"
    },
    "Moyzilla" => {
      menu: "http://boston.menupages.com/restaurants/moyzilla/menu",
      twitter: "MoyzillaTruck"
    },
    "Paris Creperie" => {
      menu: "http://pariscreperie.com/la-tour-eiffel-bostons-very-first-crepe-truck/",
      twitter: "ParisCreperie"
    },
    "Roxy's Gourmet Grilled Cheese" => {
      menu: "http://www.roxysgrilledcheese.com/menu/",
      twitter: "RoxysGrilledChz"
    },
    "Stoked Wood Fired Pizza Co." => {
      menu: "http://www.stokedpizzaco.com/menu",
      twitter: "StokedPizza"
    },
    "Tenoch Mexican" => {
      menu:  "http://www.tenochmexican.com/menu/",
      twitter: "TenochMexican"
    },
    "The Dining Car" => {
      menu: "http://diningcar.net/menu/",
      twitter: "thediningcar"
    }
  }

  def initialize(name)
    @name = name
  end

  def name_with_menu
    if pretty.key?(:menu)
      %{<a href="#{pretty[:menu]}">#{@name}</a>}
    else
      @name
    end
  end

  def twitter_link
    if pretty.key?(:twitter)
      %{ <a href="https://twitter.com/#{pretty[:twitter]}"><i class="icon-twitter-bird"></i></a>}
    else
      ''
    end
  end

  private

  def pretty
    PRETTY[@name] || {}
  end
end
