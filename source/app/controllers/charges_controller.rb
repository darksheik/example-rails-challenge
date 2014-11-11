class ChargesController < ApplicationController
  before_action :set_charge, only: [:show, :edit, :update, :destroy]

  # GET /charges
  # GET /charges.json
  def index
    @failed = Charge.failed
    @disputed = Charge.disputed
    @successful = Charge.successful
  end

  # GET /charges/1
  # GET /charges/1.json
  def show
    @customer = @charge.customer
  end

  # GET /charges/new
  def new
    @charge = Charge.new
    @users = User.all
    @companies = Company.all
  end

  # GET /charges/1/edit
  def edit
  end

  # POST /charges
  # POST /charges.json
  def create
    customer_type, customer_id = charge_params[:customer].split('-')
    remaining = charge_params.except(:customer)
    remaining[:customer_type] = customer_type
    remaining[:customer_id] = customer_id
    @charge = Charge.new(remaining)

    # Generate unique code
    respond_to do |format|
      if @charge.save
        format.html { redirect_to @charge.unique_code_url, notice: 'Charge was successfully created.' }
        format.json { render :show, status: :created, location: @charge }
      else
        format.html { render :new }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /charges/1
  # PATCH/PUT /charges/1.json
  def update
    respond_to do |format|
      if @charge.update(charge_params)
        format.html { redirect_to @charge.unique_code_url, notice: 'Charge was successfully updated.' }
        format.json { render :show, status: :ok, location: @charge }
      else
        format.html { render :edit }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charges/1
  # DELETE /charges/1.json
  def destroy
    @charge.destroy
    respond_to do |format|
      format.html { redirect_to charges_url, notice: 'Charge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charge
      @charge = Charge.find_by_unique_code(params[:unique_code])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charge_params
      params.require(:charge).permit(:amount, :unique_code, :paid, :refunded, :customer)
    end
end
