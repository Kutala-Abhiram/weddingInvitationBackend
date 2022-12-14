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

    def index
        trackings = Tracking.all
        t_json = []

        trackings.each do |track|
            t_json << { ipaddress: track.ipaddress }
        end

        render json: { ip_address: t_json, records_count: t_json.length }
    end

    def ping_site
        render json: { site: "working" }
    end

    def clear_data
        before_blessings = Blessing.count
        before_tracking = Tracking.count
        Blessing.destroy_all
        Tracking.destroy_all
        after_blessings = Blessing.count
        after_tracking = Tracking.count
        render json: { before_blessings: before_blessings, after_blessings: after_blessings, before_tracking: before_tracking, after_tracking: after_tracking }
    end

    def t_count
        before_blessings = Blessing.count
        before_tracking = Tracking.count
        render json: { before_blessings: before_blessings, before_tracking: before_tracking }
    end
end
