class PrettyNamePrinter
  MENU_URLS = {
    "Bon Me" => "http://www.bonmetruck.com/menu/",
    "Evan's NY Style Deli" => "http://www.evansnewyorkstyledeli.com/our-food-truck/food-truck-menu/",
    "Mei Mei Street Kitchen" => "http://meimeiboston.tumblr.com/",
    "Momogoose" => "http://sategrill.com/cafe-menu/",
  }

  TWITTER_NAMES = {
    'Bon Me' => 'bonme',
    'Chicken & Rice Guys' => 'CnRG_Boston',
    'Cookie Monstah' => 'MonstahTruck',
    'Mei Mei Street Kitchen' => 'meimeiboston',
    'Momogoose' => 'momogoose',
    'Moyzilla' => 'MoyzillaTruck',
    "Roxy's Gourmet Grilled Cheese" => 'RoxysGrilledChz',
    'Tenoch Mexican' => 'TenochMexican',
  }

  def initialize(name)
    @name = name
  end

  def print
    name_with_menu + twitter
  end

  private

  def name_with_menu
    if MENU_URLS.key?(@name)
      %{<a href="#{MENU_URLS[@name]}">#{@name}</a>}
    else
      @name
    end
  end

  def twitter
    if TWITTER_NAMES.key?(@name)
      %{ <a href="https://twitter.com/#{TWITTER_NAMES[@name]}"><i class="icon-twitter-bird"></i></a>}
    else
      ''
    end
  end
end
