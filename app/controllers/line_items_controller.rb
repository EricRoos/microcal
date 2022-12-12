# frozen_string_literal: true

class LineItemsController < ApplicationController
  def index
    authorize LineItem
    @slots = current_user.line_items.where(date: params[:dates]).to_a.group_by(&:date)
    @slots = params[:dates].to_h { |d| [Date.parse(d), []] }.merge(@slots)
  end

  def edit
    @line_item = LineItem.find(params[:id])
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
    @line_item.reload if @line_item.errors
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
    params.require(:line_item).permit(:text, :completed, :description, :time_to_complete_minutes)
  end
end
