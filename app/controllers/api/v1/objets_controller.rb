class Api::V1::ObjetsController < Api::V1::BaseController

	before_action :set_objet, only: [:show, :update, :destroy]

	def index
		@personnage = Personnage.find(params[:personnage_id]) 
		@objets = @personnage.objets

	end

	def show
		@personnage = Personnage.find(params[:personnage_id]) 
		if @objets.personnage_id  != @personnage.id
			render json: {
	          messages: "Wrong object ID",
	          is_success: false,
	          data: {}
	        }, status: :bad_request
		end
	end

	def update
		if @objets.update(objet_params)
			render :action => 'show'
		else
			render_error
		end
	end

	def create
		@objets = Objet.new(objet_params)
		@objets.personnage_id = params[:personnage_id]
		if @objets.save
			render :show, status: :created
		else
			render_error
		end
	end

	def destroy
		@objets.destroy
		head :no_content
	end

	def set_objet
  	@objets = Objet.find(params[:id])   
 	end

	def objet_params
	  	params.require(:objet).permit(:name, :stat1, :stat2, :rarety)
	end	

	def render_error
		render json: {errors: @objets.errors.full_messages}, status: :unprocessable_entity
	end
	swagger_controller :objets, "Objets Management"

	  swagger_api :index do
	    summary "Fetches all objets items"
	    param :form, :name, :string, :required, "name"
	    param :form, :stat1, :string, :required, "stat1"
	    param :form, :stat2, :string, :required, "stat2"
	   	param :form, :stat2, :string, :required, "rarety"
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
	    summary "Creates a new objet"
	    param :form, :name, :string, :required, "name"
	    param :form, :stat1, :string, :required, "stat1"
	    param :form, :stat2, :string, :required, "stat2"
	   	param :form, :stat2, :string, :required, "rarety"
	    response :unauthorized
	    response :not_acceptable
	  end

	  swagger_api :update do
	    summary "Updates an existing User"
	    param :path, :id, :integer, :required, "Objet Id"
	    param :form, :name, :string, :required, "name"
	    param :form, :stat1, :string, :required, "stat1"
	    param :form, :stat2, :string, :required, "stat2"
	   	param :form, :stat2, :string, :required, "rarety"
	    response :unauthorized
	    response :not_found
	    response :not_acceptable
	  end

	  swagger_api :destroy do
	    summary "Deletes an existing objet item"
	    param :path, :id, :integer, :optional, "objet Id"
	    response :unauthorized
	    response :not_found
	  end
end