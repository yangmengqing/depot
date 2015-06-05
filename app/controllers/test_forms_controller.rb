class TestFormsController < ApplicationController
  before_action :set_test_form, only: [:show, :edit, :update, :destroy]

  # GET /test_forms
  # GET /test_forms.json
  def index
    @test_forms = TestForm.all
  end

  def search
    @user = {'name' => 'mengqing', 'phone' => '18591918576'}
  end

  # GET /test_forms/1
  # GET /test_forms/1.json
  def show
  end

  # GET /test_forms/new
  def new
    @test_form = TestForm.new
  end

  # GET /test_forms/1/edit
  def edit
  end

  # POST /test_forms
  # POST /test_forms.json
  def create
    @test_form = TestForm.new(test_form_params)

    respond_to do |format|
      if @test_form.save
        format.html { redirect_to @test_form, notice: 'Test form was successfully created.' }
        format.json { render :show, status: :created, location: @test_form }
      else
        format.html { render :new }
        format.json { render json: @test_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_forms/1
  # PATCH/PUT /test_forms/1.json
  def update
    respond_to do |format|
      if @test_form.update(test_form_params)
        format.html { redirect_to @test_form, notice: 'Test form was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_form }
      else
        format.html { render :edit }
        format.json { render json: @test_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_forms/1
  # DELETE /test_forms/1.json
  def destroy
    @test_form.destroy
    respond_to do |format|
      format.html { redirect_to test_forms_url, notice: 'Test form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_form
      @test_form = TestForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_form_params
      params.require(:test_form).permit(:title, :description)
    end
end
