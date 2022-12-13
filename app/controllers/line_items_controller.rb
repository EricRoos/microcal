# frozen_string_literal: true

class LineItemsController < ApplicationController
  def index
    authorize LineItem
    @slots = policy_scope(LineItem).where(date: params[:dates]).to_a.group_by(&:date)
    @slots = params[:dates].to_h { |d| [Date.parse(d), []] }.merge(@slots)
  end

  def edit
    @line_item = LineItem.find(params[:id])
    @line_item.start_time = @line_item.start_time.in_time_zone(Time.zone) if @line_item.start_time
    authorize @line_item
  end

  def create
    authorize LineItem
    current_user.transaction do
      @line_item = LineItem.create!(line_item_params)
      Event::TaskCreated.create(user: @line_item.user, meta: { id: @line_item.id })
    end
    respond_to(&:turbo_stream)
  end

  def update
    @line_item = LineItem.find(params[:id])
    authorize @line_item
    @line_item.assign_attributes(update_line_item_params)
    flash.now.notice = 'Updated' if @line_item.changed? && @line_item.save
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    authorize @line_item
    @line_item.destroy
    flash.now.notice = 'Deleted'
  end

  protected

  def line_item_params
    params.require(:line_item).permit(:text, :id, :date).merge(user: current_user)
  end

  def update_line_item_params
    params.require(:line_item).permit(:text, :completed, :description, :time_to_complete_minutes, :date,
                                      :start_time).tap do |p|
      if p[:start_time]
        start_time = @line_item.date.to_time.in_time_zone
        sent_time = p[:start_time].to_time
        start_time = start_time.change({ hour: sent_time.hour, min: sent_time.min })
        # start_time.zone = session['timezone']
        p[:start_time] = start_time.utc
      end
    end
  end
end
