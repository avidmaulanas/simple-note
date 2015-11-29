require 'rails_helper'

RSpec.describe "notes/edit", type: :view do
  before(:each) do
    @note = assign(:note, Note.create!(
      :title => "MyString",
      :content => "MyText",
      :lists => ""
    ))
  end

  it "renders the edit note form" do
    render

    assert_select "form[action=?][method=?]", note_path(@note), "post" do

      assert_select "input#note_title[name=?]", "note[title]"

      assert_select "textarea#note_content[name=?]", "note[content]"

      assert_select "input#note_lists[name=?]", "note[lists]"
    end
  end
end
