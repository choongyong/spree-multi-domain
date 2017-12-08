Spree::Tracker.class_eval do
  belongs_to :store

  #Taken from https://github.com/spree-contrib/spree-multi-domain/issues/104
  def self.current(domain = nil)
    domain ||= Spree::Store.current.url
    Spree::Tracker.where(active: true).joins(:store).where("spree_stores.url LIKE ?", "%#{domain}%").first
  end
end
