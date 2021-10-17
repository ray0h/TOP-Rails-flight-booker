module EmailHelper
  def email_image_tag(image)
    attachments[image] = File.read(Rails.root.join("app/assets/images/odin_logo.svg"))
    image_tag attachments[image].url, size:'25x18', alt: 'TOP logo'
  end
end