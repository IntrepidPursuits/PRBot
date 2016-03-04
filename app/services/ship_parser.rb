class ShipParser
   attr_reader :params, :user
  
  def initialize(params)
    @params = params
  end

  def parse
    pr_number = @params[:text].scan(/\/\d+/).first
    return nil if user.nil?
    pull_request = PullRequest.where(user: user, approved_at: nil).where( 'link LIKE ?', "%#{pr_number}").first
    pull_request
  end

  def self.parse(params)
    new(params).parse
  end

  private

  def user
    name = @params[:text].scan(/@(\w+){1}/).first.first
    @user ||= User.find_by(name: name)
  end
end