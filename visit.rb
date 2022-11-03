class Visit
  attr_reader :page, :ip

  def initialize(page:, ip:)
    @page = page
    @ip = ip
  end
end
