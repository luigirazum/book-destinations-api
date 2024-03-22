# frozen_string_literal: true

module Api
  module V1
    class ReservationsController < ApplicationController # rubocop:disable Style/Documentation
      before_action :authenticate_user!
      def index
        @reservations = current_user.reservations
        render json: @reservations
      end

      def create # rubocop:disable Metrics/MethodLength
        @destination = Destination.find(reservation_params[:destination_id])

        if @destination.nil?
          render json: { error: 'Destination not found' }, status: :unprocessable_entity
          return
        end

        @current_user = current_user
        user = User.find(@current_user.id)
        reservation = user.reservations.build(reservation_params)

        if reservation.save
          render json: { status: 'success', reservation: }, status: :created
        else
          render json: { status: 'error', errors: reservation.errors }, status: :unprocessable_entity
        end
      end

      private

      def reservation_params
        params.require(:reservation).permit(:destination_id, :total_people, :start_date, :end_date, :include_meals)
      end
    end
  end
end
