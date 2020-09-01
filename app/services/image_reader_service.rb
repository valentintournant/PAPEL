# this service is responsible to extract the text with a given cloudinary key
# it will create a temporary image, read it with tessereact then delete the tmp file

class ImageReaderService

  TMP_FILE_NAME = "/tmp/image.jpg"

  def self.call(image_id)
    url = Cloudinary::Utils.cloudinary_url(image_id)
    File.open(TMP_FILE_NAME, "wb") { |f| f.write HTTParty.get(url).body }
    image_text = RTesseract.new(TMP_FILE_NAME).to_s
    File.delete(TMP_FILE_NAME) if File.exist? TMP_FILE_NAME
    image_text
  end

end
