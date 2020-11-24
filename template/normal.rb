# coding: utf-8


converter.add(["slide"], ["root"]) do |element, _, number|
  this = ""
  slide_number = element.attribute("number").to_s.to_i
  Tag.repeat(element) do |count|
    variables[:slide_count] = variables[:slide_count].to_i + 1
    this << Tag.build("div", "slide") do |this|
      this << Tag.new("div", "header")
      this << Tag.new("div", "footer")
      this << Tag.build("div", "logo") do |this|
        this << Tag.build("image") do |this|
          this["src"] = "../asset/logo.svg"
        end
      end
      this << Tag.build("div", "content") do |this|
        this << apply(element, "slide", count)
      end
    end
  end
  next this
end

converter.add(["sh", "en"], ["slide"]) do |element, _, count|
  this = ""
  duplication = (element.name == "sh") ? 2 : 1
  duplication.times do
    this << Tag.build("div", "text") do |this|
      this.set_range(element, count)
      this["class"] << " " + element.name
      this << apply(element, "slide", count)
    end
  end
  next this
end
