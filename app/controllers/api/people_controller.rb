class Api::PeopleController < Api::ApiController
  def index
    @people = Person.all
    render json: @people, status: :ok
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      render json: @person, status: :created
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  def update
    @person = Person.find(params[:id])
    if @person.update(person_params)
      render json: @person, status: :accepted
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @person = Person.find(params[:id])
    if @person.destroy
      render json: @person, status: :accepted
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  private

  def person_params
    params.permit(:first_name, :last_name, :email, :address_line_1,
                  :address_line_2, :address_city, :address_state, :address_zip)
  end
end
