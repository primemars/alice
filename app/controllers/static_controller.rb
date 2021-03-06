class StaticController < ApplicationController
    before_filter :authenticate_user!, :except => :show_home
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

  def show_pattern
    @active_standard = true
    @patterns = File.read(Article::PATTERN_FILE).split("\n")
  end
end
