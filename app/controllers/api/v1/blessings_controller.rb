class Api::V1::BlessingsController < ApplicationController
    def create
        blessing = Blessing.new(blessings_params)
        blessing.date = Time.now
        blessing.ipaddress = request.remote_ip
        if blessing.save
            render json: blessing, status: 200
        else
            render json: {error: 'Error while creating blessings'}
        end
    end

    private

    def blessings_params
        params.require(:blessing).permit(:name, :notes)
    end
end
