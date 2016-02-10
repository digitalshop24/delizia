class EntriesController < ApplicationController
  def create
  	Entry.create(entry_params)
  end

  private
  def entry_params
    params.require(:entry).permit(:name, :phone)
  end
end
