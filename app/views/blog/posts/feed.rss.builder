xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title Rails.application.config.site_name
    xml.description Rails.application.config.meta_description
    xml.link root_url

    for post in @posts
      xml.item do
        xml.title post.title
        xml.description raw(post.content)
        xml.pubDate post.published_at.to_s(:rfc822)
        xml.link Rails.application.config.site_url + post.full_url
        xml.guid Rails.application.config.site_url + post.full_url
      end
    end
  end
end
