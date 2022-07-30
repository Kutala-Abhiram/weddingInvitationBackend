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

    def index
        blessings = Blessing.all
        b_json = []
        blessings.each do |blessing|
            b_json << { name: blessing.name, notes: blessing.notes, ipaddress: blessing.ipaddress, date: blessing.date }
        end

        render json: { blessing_array: b_json, records_count: b_json.length }
    end

    private

    def blessings_params
        params.require(:blessing).permit(:name, :notes)
    end
end
