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
end