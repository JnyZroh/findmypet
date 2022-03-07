require "open-uri"

class PosterPdf < Prawn::Document
  def initialize(poster)
    super(top_margin: 70)
    @poster = poster
    header
    pet_photo
    description
    contact
  end

  def header

    text "Missing #{@poster.pet.species.capitalize}: #{@poster.pet.name.capitalize}",
    size: 36, style: :bold,  align: :center
    # date_obj = DateTime.strptime(@poster.date_missing,'%Y-%m-%d %H:%M:%S%Z')
    # format   = date_obj.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
    move_down 5
    i = @poster.address.index(',')-1
    address = @poster.address[0..i]
    text "#{@poster.pet.color.capitalize} #{@poster.pet.breed}, last seen near #{address}",
      size: 18, align: :center
    move_down 5
    text "Missing since #{@poster.date_missing.strftime("%A, %B %d, %Y")}",
    size: 18, align: :center
  end

  def pet_photo
    move_down 20
    photo_url = URI.open(@poster.pet.photos.first.url)
    image photo_url, { fit: [400, 400],
                        position: :center
    }
  end

  def description
    move_down 40
    text "#{@poster.pet.description}",
      size: 18, align: :center, leading: 4
  end

  def contact
    move_down 40
    text "Contact #{@poster.pet.user.first_name} #{@poster.pet.user.last_name}",
      size: 24, style: :bold, align: :center, leading: 4
    text "at #{@poster.pet.user.phone_number}",
      size: 24, style: :bold, align: :center, leading: 4
  end
end
