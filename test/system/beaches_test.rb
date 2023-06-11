require "application_system_test_case"

class BeachesTest < ApplicationSystemTestCase
  setup do
    @beach = beaches(:one)
  end

  test "visiting the index" do
    visit beaches_url
    assert_selector "h1", text: "Beaches"
  end

  test "should create beach" do
    visit beaches_url
    click_on "New beach"

    fill_in "Address", with: @beach.address
    fill_in "Latitude", with: @beach.latitude
    fill_in "Longitude", with: @beach.longitude
    click_on "Create Beach"

    assert_text "Beach was successfully created"
    click_on "Back"
  end

  test "should update Beach" do
    visit beach_url(@beach)
    click_on "Edit this beach", match: :first

    fill_in "Address", with: @beach.address
    fill_in "Latitude", with: @beach.latitude
    fill_in "Longitude", with: @beach.longitude
    click_on "Update Beach"

    assert_text "Beach was successfully updated"
    click_on "Back"
  end

  test "should destroy Beach" do
    visit beach_url(@beach)
    click_on "Destroy this beach", match: :first

    assert_text "Beach was successfully destroyed"
  end
end
