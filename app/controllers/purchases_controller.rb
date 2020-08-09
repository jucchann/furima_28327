class PurchasesController < ApplicationController
  def new
    @purchase = User.new
  end
end
