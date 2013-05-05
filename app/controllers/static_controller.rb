class StaticController < ApplicationController
  def show_home
    @active_home = true
  end
  
  def show_importance
    @active_importance = true
  end

  def show_introduction
    @active_standard = true
  end

  def show_advantage
    @active_standard = true
  end
end
