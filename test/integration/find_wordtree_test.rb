require "integration_test_helper"

class FindWordtreeTest < ActionDispatch::IntegrationTest
  setup do
  end

  test "submit file and fine longest wordtree" do
    visit root_path
    page.attach_file(
      "wordlist",
      Rails.root.join("lib/test_file/wordlist_traditionless.dat")
    )
    click_on "Submit"
    assert page.has_content?("traditionless")
  end
end
