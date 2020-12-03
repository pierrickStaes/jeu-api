class Api::V1::PersonnagesController < Api::V1::BaseController

	before_action :set_personnage, only: [:show, :update, :destroy]
	#before_action :authenticate_user!, except: [:index, :show, :create]

  	#acts_as_token_authentication_handler_for User, except: [:index, :show, :create]

	def index
		if params[:query].present?
			@personnages = Personnage.search(params[:query])
		  else
			@personnages = Personnage.all
		end
	end

	def show
    	@objets = Objet.where(:personnage_id => @personnages.id)
	end

	def update
		if @personnages.update(personnage_params)
			@objets = Objet.where(:personnage_id => @personnages.id)			
			render :action => 'show'
		else
			render_error
		end
	end

	def create
		@personnages = Personnage.new(personnage_params)
		if @personnages.save
			render :show, status: :created
		else
			render_error
		end
	end

	def destroy
		@personnages.destroy
		head :no_content
	end

	def set_personnage
  	@personnages = Personnage.find(params[:id])   
 	end

	def personnage_params
	  	params.require(:personnage).permit(:name, :personnage_class, :niveau)
	end	

	def render_error
		render json: {errors: @personnages.errors.full_messages}, status: :unprocessable_entity
	end




	swagger_controller :personnages, "Personnage Management"

	  swagger_api :index do
	    summary "Fetches all personnages items"
	    param :form, :name, :string, :required, "name"
	    param :form, :personnage_class, :string, :required, "personnage_class"
	    param :form, :niveau, :string, :required, "niveau"
	    response :unauthorized
	    response :not_acceptable, "The request you made is not acceptable"
	  end

	  swagger_api :show do
	    summary "Fetches a single personnages item"
	    param :path, :id, :integer, :optional, "Personnage Id"
	    response :ok, "Success", :User
	    response :unauthorized
	    response :not_acceptable
	    response :not_found
	  end

	  swagger_api :create do
	    summary "Creates a new personnages"
	    param :form, :name, :string, :required, "name"
	    param :form, :personnage_class, :string, :required, "personnage_class"
	    param :form, :niveau, :string, :required, "niveau"
	    response :unauthorized
	    response :not_acceptable
	  end

	  swagger_api :update do
	    summary "Updates an existing User"
	    param :path, :id, :integer, :required, "Personnage Id"
	    param :form, :name, :string, :optional, "name"
	    param :form, :personnage_class, :string, :optional, "personnage_class"
	    param :form, :niveau, :string, :optional, "niveau"
	    response :unauthorized
	    response :not_found
	    response :not_acceptable
	  end

	  swagger_api :destroy do
	    summary "Deletes an existing personnage item"
	    param :path, :id, :integer, :optional, "Personnage Id"
	    response :unauthorized
	    response :not_found
	  end
end