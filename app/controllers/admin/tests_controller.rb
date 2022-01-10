# frozen_string_literal: true

class Admin::TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[show start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.created_tests.build(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.result(@test)
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
  
  def rescue_with_test_not_found
    render plain: 'Test not found'
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
