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

  end

  def details
    move_down 20
    text "now add details"
  end

  def contact
    move_down 40
    text "now add contact"
  end
end
