require "application_system_test_case"

class ShowRoomsTest < ApplicationSystemTestCase
  setup do
    @show_room = show_rooms(:one)
  end

  test "visiting the index" do
    visit show_rooms_url
    assert_selector "h1", text: "Show Rooms"
  end

  test "creating a Show room" do
    visit show_rooms_url
    click_on "New Show Room"

    click_on "Create Show room"

    assert_text "Show room was successfully created"
    click_on "Back"
  end

  test "updating a Show room" do
    visit show_rooms_url
    click_on "Edit", match: :first

    click_on "Update Show room"

    assert_text "Show room was successfully updated"
    click_on "Back"
  end

  test "destroying a Show room" do
    visit show_rooms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Show room was successfully destroyed"
  end
end
