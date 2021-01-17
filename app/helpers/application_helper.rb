module ApplicationHelper
  def titre
    base_titre = "Mon App"
    if @titre.nil?  # si @titre est nulle ecrire base_titre comme titre
      base_titre
    else
      "#{@titre} | #{base_titre}"
    end
  end
end
