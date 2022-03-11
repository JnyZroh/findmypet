require "open-uri"

class PosterPdf < Prawn::Document
  def initialize(poster, url)
    super(top_margin: 70)
    @poster = poster
    header
    pet_photo
    description
    contact
    qrcode(url)
  end


  def header
    text "Missing #{@poster.pet.species.capitalize}:",
    size: 28,  align: :center
    text "#{@poster.pet.name.capitalize}",
    size: 36, style: :bold,  align: :center
    move_down 5
    i = @poster.address.index(',')-1
    address = @poster.address[0..i]

    text "#{@poster.pet.color.capitalize}, #{@poster.pet.breed} #{@poster.pet.species.downcase}, last seen near #{address}",
    size: 18, align: :center

    move_down 5
    text "Missing since #{@poster.date_missing.strftime("%A, %B %d, %Y")}",
    size: 18, align: :center
  end

  def pet_photo
    move_down 20
    photo_url = URI.open(@poster.pet.photos.first.url)
    image photo_url, { fit: [300, 300],
      position: :center
    }
  end

  def description
    move_down 30
    text "#{@poster.comment}",
    size: 18, align: :center, leading: 4
  end

  def contact
    move_down 20
    text "Contact #{@poster.pet.user.first_name} #{@poster.pet.user.last_name}",
    size: 24, style: :bold, align: :right, leading: 4
    text "at #{@poster.pet.user.phone_number}",
    size: 24, style: :bold, align: :right, leading: 4
  end

  def qrcode(url)
    move_up 70
    @qrcode_content = url
    print_qr_code(@qrcode_content, :dot=>2.8)
    move_down 2
    size: 12, align: :left
  end
end
