# frozen_string_literal: true

class LineItemsController < ApplicationController
  def index
    @slots = current_user.line_items.where(date: params[:dates]).to_a.group_by(&:date)
    @slots = params[:dates].to_h { |d| [Date.parse(d), []] }.merge(@slots)
  end

  def edit
    @line_item = LineItem.find(params[:id])
  end

  def create
    current_user.transaction do
      @line_item = LineItem.create!(line_item_params)
      Event::TaskCreated.create(user: @line_item.user, meta: { id: @line_item.id })
    end
    respond_to(&:turbo_stream)
  end

  def update
    @line_item = LineItem.find(params[:id])
    @line_item.assign_attributes(params.require(:line_item).permit(:text, :completed, :description))
    flash.now.notice = 'Updated' if @line_item.changed? && @line_item.save
    @line_item.reload if @line_item.errors
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    flash.now.notice = 'Deleted'
  end

  protected

  def line_item_params
    params.require(:line_item).permit(:text, :id, :date).merge(user: current_user)
  end
end
