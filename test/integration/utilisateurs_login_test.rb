require 'test_helper'

class UtilisateursLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  #

  test "login invalide" do
   	get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: "", password: "" }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end