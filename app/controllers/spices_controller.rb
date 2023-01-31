class SpicesController < ApplicationController
    wrap_parameters format: []
    # GET /spices
    def index 
        render json: Spice.all
    end
    #POST /spices
    def create
        render json: Spice.create(spice_params), status: :created
    end

    def update
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.update(spice_params)
            render json: spice
        else
            render json: { error: "Spice not found"}, status: :not_found
        end
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        if spice 
            spice.destroy
            head :no_content
        else
            render json: { error: "Spice not found"}, status: :not_found
        end
    end

    private
    
    def spice_params 
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
