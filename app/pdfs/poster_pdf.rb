class PosterPdf < Prawn::Document
  def initialize(poster)
    super(top_margin: 70)
    @poster = poster
    header
    details
    contact
  end

  def header
    text "Missing Pet: #{@poster.pet.name}", size: 36, style: :bold
  end

  def image
    text "Add image"
  end

  def details
    move_down 20
    text "Add pet details"
  end

  def contact
    move_down 40
    text "Add contact"
  end
end
