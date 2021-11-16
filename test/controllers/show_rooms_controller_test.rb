require 'test_helper'

class ShowRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @show_room = show_rooms(:one)
  end

  test "should get index" do
    get show_rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_show_room_url
    assert_response :success
  end

  test "should create show_room" do
    assert_difference('ShowRoom.count') do
      post show_rooms_url, params: { show_room: {  } }
    end

    assert_redirected_to show_room_url(ShowRoom.last)
  end

  test "should show show_room" do
    get show_room_url(@show_room)
    assert_response :success
  end

  test "should get edit" do
    get edit_show_room_url(@show_room)
    assert_response :success
  end

  test "should update show_room" do
    patch show_room_url(@show_room), params: { show_room: {  } }
    assert_redirected_to show_room_url(@show_room)
  end

  test "should destroy show_room" do
    assert_difference('ShowRoom.count', -1) do
      delete show_room_url(@show_room)
    end

    assert_redirected_to show_rooms_url
  end
end
