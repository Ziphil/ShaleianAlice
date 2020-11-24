# coding: utf-8


converter.add(["slide"], ["root"]) do |element, _, number|
  this = ""
  slide_number = element.attribute("number").to_s.to_i
  Tag.repeat(element) do |count|
    variables[:slide_count] = variables[:slide_count].to_i + 1
    this << Tag.build("div", "slide") do |this|
      this << Tag.new("div", "header")
      this << Tag.new("div", "footer")
      this << Tag.build("div", "content") do |this|
        this << apply(element, "slide", count)
      end
    end
  end
  next this
end