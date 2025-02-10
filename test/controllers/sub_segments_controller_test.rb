require "test_helper"

class SubSegmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_segment = sub_segments(:one)
  end

  test "should get index" do
    get sub_segments_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_segment_url
    assert_response :success
  end

  test "should create sub_segment" do
    assert_difference("SubSegment.count") do
      post sub_segments_url, params: { sub_segment: { segment_id: @sub_segment.segment_id, status: @sub_segment.status, sub_segment_name: @sub_segment.sub_segment_name } }
    end

    assert_redirected_to sub_segment_url(SubSegment.last)
  end

  test "should show sub_segment" do
    get sub_segment_url(@sub_segment)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_segment_url(@sub_segment)
    assert_response :success
  end

  test "should update sub_segment" do
    patch sub_segment_url(@sub_segment), params: { sub_segment: { segment_id: @sub_segment.segment_id, status: @sub_segment.status, sub_segment_name: @sub_segment.sub_segment_name } }
    assert_redirected_to sub_segment_url(@sub_segment)
  end

  test "should destroy sub_segment" do
    assert_difference("SubSegment.count", -1) do
      delete sub_segment_url(@sub_segment)
    end

    assert_redirected_to sub_segments_url
  end
end
