class Api::V1::PeopleController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_person!

  respond_to :json

  def index
    respond_to do |format|
      format.json { @people = Person.all }
    end
  end
end
