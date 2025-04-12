require "test_helper"

class MusicGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get music_genres_index_url
    assert_response :success
  end
end
