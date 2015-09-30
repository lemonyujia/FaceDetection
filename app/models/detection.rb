class Detection < ActiveRecord::Base

  has_attached_file :image, styles: {
                      medium: "300x300>",
                      square: "200x200",
                      thumb: "100x100>"
                    }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def detect_face
      query = "https://faceplusplus-faceplusplus.p.mashape.com/detection/detect?attribute=glass%2Cpose%2Cgender%2Cage%2Crace%2Csmiling&url=#{self.image.url}"
      headers = {
        "X-Mashape-Key" => "D6sQ66vv2JmshMPZ7FcpwotH4jhGp1amWTLjsnBnIm7TOVueUY",
        "Accept" => "application/json"
      }
      data = RestClient.get(query,headers)
      result = JSON.load(data)

      #find detection attributes from result
      unless result["face"] == nil
        self.age = result["face"].first["attribute"]["age"]["value"]
        self.gender = result["face"].first["attribute"]["gender"]["value"]
        self.glass = result["face"].first["attribute"]["glass"]["value"]
        self.race = result["face"].first["attribute"]["race"]["value"]
        self.smiling = (result["face"].first["attribute"]["smiling"]["value"]).to_s
    end
  end
end
