require 'test_helper'

class UtilisateurTest < ActiveSupport::TestCase
  def setup
    @utilisateur = Utilisateur.new(
                                  nom = "Karim Allaoui",
                                  email = "karim@example.com",
                                  password = "motdepasse",
                                  password_confirmation = "motdepasse")
  end

  test "nom doit etre present" do
    @utilisateur.nom = ""
    assert_not @utilisateur.valid?
  end

  test "email doit etre present" do
    @utilisateur.email = ""
    assert_not @utilisateur.valid?
  end

  test "nom ne doit pas etre trop long" do
    @utilisateur.nom = "a" * 51
    assert_not @utilisateur.valid?
  end

  test "email ne doit pas etre trop long" do
    @utilisateur.email = "a" * 246 + "@example.com"
    assert_not @utilisateur.valid?
  end

  test "email validation doit accepter les emails valides" do
    valid_adresses=%w[@exemple.com AAA@foo.COM A_MA-ER@foo.bar.org aaa.bbbb@foo.ma aa+bbb@baz.cn]
    valid_adresses.each do |valid_adress|
    @utilisateur.email = valid_adress
    assert @utilisateur.valid?
    end
  end

  test "email doit etre unique" do
    duplicate_utilisateur = @utilisateur.dup
    duplicate_utilisateur.email = @utilisateur.email.upcase
    @utilisateur.save
    assert_not duplicate_utilisateur.valid?
  end

  test "mot de passe non vide" do
    @utilisateur.password = @utilisateur.password_confirmation = " " * 6
    assert_not @utilisateur.valid?
  end

  test "mot de passe de 6 carac min" do
    @utilisateur.password = @utilisateur.password_confirmation = "a" * 5
    assert_not @utilisateur.valid?
  end


  def change
    add_index :utilisateurs, :email, unique: true
  end



  # test "the truth" do
  #   assert true
  # end
end
