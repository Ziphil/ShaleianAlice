# coding: utf-8


converter.add(["slide"], ["root"]) do |element, _, number|
  this = ""
  Tag.repeat(element) do |count|
    variables[:slide_count] = variables[:slide_count].to_i + 1
    slide_number = variables[:slide_count].to_s.to_i
    this << Tag.build("div", "slide") do |this|
      this << Tag.new("div", "header")
      this << Tag.build("div", "footer") do |this|
        this << Tag.build("div", "source") do |this|
          this << "Alice's Adventures in Wonderland"
        end
      end
      this << Tag.build("div", "number") do |this|
        this << slide_number.to_s
      end
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
    this << Tag.build("div", "text-wrapper") do |this|
      this.set_range(element, count)
      this["class"] << " " + element.name
      this << Tag.build("div", "text") do |this|
        this << apply(element, "slide", count)
      end
    end
  end
  next this
end
