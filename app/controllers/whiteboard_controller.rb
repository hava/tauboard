require 'active_resource'
require "board"

class WhiteboardController < ApplicationController

  def refresh
    token = session[:token]
    if (token)
      @project_id = params[:project] || '21123'
      @iteration_group = params[:iteration] || 'current'
      iteration = current_iteration(@project_id, @iteration_group, token)
      @board = Board.new(iteration)
    else
      redirect_to sessions_new_path unless token
    end
  end

  def show
    refresh
  end

  private
  def current_iteration(project_id, iteration_group, token)
    iterations = Iteration.find(token, :params => {:project_id => project_id, :group => iteration_group})
    Iteration.new(iterations[0])
  end
end
