class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    ActiveRecord::Base.transaction(joinable: false, requires_new: true) do
      @person.save!
      @person.create_pillars!(use_meikyu: params[:use_meikyu])
      raise ActiveRecord::Rollback
    end
    @person = PersonDecorator.decorate(@person)
    render action: :show
  rescue ActiveRecord::RecordInvalid
    render action: :new
  end

  def show
    @person = PersonDecorator.decorate(Person.find(params[:id]))
  end

  def destroy
    Person.destroy(params[:id])
  end

  private def person_params
    params.require(:person).permit(:datetime_of_birth, :sex, :name)
  end
end
