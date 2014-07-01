class PrettyNamePrinter
  PRETTY = YAML.load(open(File.join(DATA_DIRECTORY, "boston.yml")))

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
