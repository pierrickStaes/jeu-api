class Api::V1::PersonnagesController < Api::V1::BaseController

	before_action :set_personnage, only: [:show, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show, :create]

  	acts_as_token_authentication_handler_for User, except: [:index, :show, :create]

	def index
		@personnages = Personnage.all
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
end