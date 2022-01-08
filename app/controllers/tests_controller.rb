# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[show start]
  before_action :find_user, only: %i[start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.result(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_user
    @user = @current_user
  end
  
  def rescue_with_test_not_found
    render plain: 'Test not found'
  end
end
