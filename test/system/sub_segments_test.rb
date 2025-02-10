require "application_system_test_case"

class SubSegmentsTest < ApplicationSystemTestCase
  setup do
    @sub_segment = sub_segments(:one)
  end

  test "visiting the index" do
    visit sub_segments_url
    assert_selector "h1", text: "Sub segments"
  end

  test "should create sub segment" do
    visit sub_segments_url
    click_on "New sub segment"

    fill_in "Segment", with: @sub_segment.segment_id
    check "Status" if @sub_segment.status
    fill_in "Sub segment name", with: @sub_segment.sub_segment_name
    click_on "Create Sub segment"

    assert_text "Sub segment was successfully created"
    click_on "Back"
  end

  test "should update Sub segment" do
    visit sub_segment_url(@sub_segment)
    click_on "Edit this sub segment", match: :first

    fill_in "Segment", with: @sub_segment.segment_id
    check "Status" if @sub_segment.status
    fill_in "Sub segment name", with: @sub_segment.sub_segment_name
    click_on "Update Sub segment"

    assert_text "Sub segment was successfully updated"
    click_on "Back"
  end

  test "should destroy Sub segment" do
    visit sub_segment_url(@sub_segment)
    click_on "Destroy this sub segment", match: :first

    assert_text "Sub segment was successfully destroyed"
  end
end
