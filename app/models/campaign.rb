class Campaign < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :brand
  has_many :ambassadors
  has_and_belongs_to_many :countries
  belongs_to :interest
  has_many   :ambassador_requests
  has_many :impressions, through: :ambassadors
  mount_uploader :image, ImageUploader
  has_many :instagram_posts

  attr_accessible :name, :description, :url, :country_ids, :interest, :image, :tag

  def save_data_from_api
    min_tag_id = self.min_tag_id
    uri = ""

    if (min_tag_id.nil?)
      uri = "https://api.instagram.com/v1/tags/#{self.tag}/media/recent?access_token=806401368.5aa13be.4a08df065cbb41469c9cc20041432d3b"
      response = HTTParty.get(uri).parsed_response
      if response["pagination"]["min_tag_id"]
        load_posts(response)
        self.save_data_from_api
      else
        return true
      end
    elsif !(min_tag_id.nil?)
      uri = "https://api.instagram.com/v1/tags/#{self.tag}/media/recent?access_token=806401368.5aa13be.4a08df065cbb41469c9cc20041432d3b&max_tag_id=#{min_tag_id}"
      response = HTTParty.get(uri).parsed_response
      if response["pagination"]["max_tag_id"]
        uri = "https://api.instagram.com/v1/tags/#{self.tag}/media/recent?access_token=806401368.5aa13be.4a08df065cbb41469c9cc20041432d3b&max_tag_id=#{min_tag_id}"
        response = HTTParty.get(uri).parsed_response
        load_posts(response)
        self.save_data_from_api
      else
        return true
      end
    end
  end

  def load_posts(response)
    data = response["data"]
    data.map do |ipost|
      instagram_post = self.instagram_posts.build
      instagram_post.uid = ipost["caption"]["from"]["id"]
      instagram_post.username = ipost["caption"]["from"]["username"]
      instagram_post.caption = ipost["caption"]["text"]
      instagram_post.created_at = ipost["caption"]["created_time"]
      instagram_post.comments = ipost["comments"]["count"]
      instagram_post.likes = ipost["likes"]["count"]
      instagram_post.link = ipost["link"]
      instagram_post.image = ipost["images"]["standard_resolution"]["url"]
      self.instagram_posts.push(instagram_post)
    end
    self.min_tag_id = response["pagination"]["min_tag_id"]
    self.save
  end
end
