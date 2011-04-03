require "rubygems"
require "test/unit"
require "htmlize"

class TestHtmlize < Test::Unit::TestCase
  
  def test_nil_is_nil
    assert_equal nil, 
                ::Htmlize::htmlize(nil)
  end

  def test_empty_string_is_untouched
    assert_equal "", 
                ::Htmlize::htmlize("")
  end

  def test_single_p_is_untouched
    assert_equal "<p>Content</p>", 
                ::Htmlize::htmlize("<p>Content</p>")
  end

  def test_two_ps_are_untouched
    assert_equal "<p>Content1</p>\n<p>Content2</p>", 
                ::Htmlize::htmlize("<p>Content1</p>\n<p>Content2</p>")
  end
  
  def test_single_body_text_turns_into_paragraph
    assert_equal "<p>Content</p>", 
                ::Htmlize::htmlize("Content")
  end
  
  def test_two_body_text_separated_by_a_line_turns_into_a_paragraph_with_br
    assert_equal "<p>Content1<br>\nContent2<br>\nContent3</p>", 
                ::Htmlize::htmlize("Content1\nContent2\nContent3")
  end

  def test_body_texts_separated_by_empty_lines_turns_into_paragraphs
    assert_equal "<p>Content1</p>\n\n<p>Content2</p>\n\n<p>Content3</p>", 
                ::Htmlize::htmlize("Content1\n\nContent2\n\nContent3")
  end

  def test_body_texts_separated_by_empty_lines_turns_into_same_tag_that_was_used
    assert_equal "<div>Content1</div>\n\n<div>Content2</div>\n\n<div>Content3</div>", 
                ::Htmlize::htmlize("<div>Content1\n\nContent2\n\nContent3</div>")
  end
end