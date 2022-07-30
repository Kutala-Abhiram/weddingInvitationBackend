class Api::V1::TrackingsController < ApplicationController
    def create
        tracking = Tracking.new
        tracking.source = Tracking::SOURCE.key(params[:tracking][:source])
        tracking.date = Time.now
        tracking.ipaddress = request.remote_ip
        if tracking.save
            render json: tracking, status: 200
        else
            render json: {error: 'Error while creating trackings'}
        end
    end

    def ping_site
        render json: { site: "working" }
    end
end
