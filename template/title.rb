# coding: utf-8


converter.add(["title-slide"], ["root"]) do |element, _, count|
  this = ""
  Tag.repeat(element) do |count|
    variables[:slide_count] = variables[:slide_count].to_i + 1
    this << Tag.build("div", "title-slide") do |this|
      this << Tag.build("div", "content") do |this|
        this << Tag.build("div", "title") do |this|
          this << "Alice's Adventures in Wonderland"
        end
        this << Tag.build("div", "subtitle") do |this|
          this << "Sheleian Translation"
        end
      end
    end
  end
  next this
end