class AboutController < ApplicationController
  def index
    @coffees = Coffeemeet.where("confirmed = ?", true)
    @pendingcoffees = Coffeemeet.where("confirmed = ?", false).where("accepted = ?", true)
  end



end
