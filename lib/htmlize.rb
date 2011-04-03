require 'nokogiri'


class Htmlize
  def self.htmlize(content)
    return nil if content.nil?
    return '' if content.empty?
    
    document = Nokogiri::HTML(content)
    body = document.xpath('html/body').first

    contents = tree_as_set(body){ |node| node.text? && !node.content.match(/^\s+$/) }
    contents.each do |node|
      texts = node.content.split("\n\n")
      tag = node.parent.name
      node.parent.replace(texts.map{ |text| "<#{tag}>" + text.gsub("\n", "<br>\n") + "</#{tag}>" }.join("\n\n"))
    end

    body.children.to_html
  end
  
  private 
  
  def self.tree(node, &block)
    yield node
    node.children.each do |child|
      self.tree(child, &block)
    end
  end
  
  def self.tree_as_set(node, &block)
    set = Nokogiri::XML::NodeSet.new(node.document)
    tree(node) do |node|
      set << node if block.call(node)
    end
    set
  end
end