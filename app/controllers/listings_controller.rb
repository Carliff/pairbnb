class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :update, :destroy]
  before_action :set_sluglisting, only: [:edit]
  # Ensure the user is logged in.
  before_action :authorize, only: [:new, :show, :edit, :create, :update, :destroy]

  # GET /listings
  # GET /listings.json
  def index
    if params[:search]
      @listings = Listing.where(["city LIKE ?","%#{params[:search]}%"])
      @listings = Listing.paginate(:page => params[:page], :per_page => 12)
    else
      @listings = Listing.all
      @listings = Listing.paginate(:page => params[:page], :per_page => 12) 

    end
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @reservation = Reservation.new
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
    authorize! :manage, @listing
    
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = current_user.listings.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    authorize! :manage, @listing
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.friendly.find(params[:id])
    end

    def set_sluglisting
      @listing = Listing.friendly.find_by(slug: params[:slug])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :host, :description, :price, :availability, :image, :resource, :pets, :smoking, :city, :guest)
    end
end
