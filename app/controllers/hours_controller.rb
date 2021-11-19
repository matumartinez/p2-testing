class HoursController < ApplicationController
  before_action :set_hour, only: %i[ show edit update destroy ]
  helper_method :sort_list

  # GET /hours or /hours.json
  def index
    @hour = Hour.find_by(room_id: params[:room_id]) if params[:room_id].present?
    @room = @hour.room
    @hours = @room.hours
    @hours
  end

  # GET /hours/1 or /hours/1.json
  def show
    @hour = Hour.find_by(id: params[:id])
    @seats = @hour.seats
    @seats
  end

  # GET /hours/new
  def new
    @hour = Hour.new
  end

  # GET /hours/1/edit
  def edit
  end

  # POST /hours or /hours.json
  def create
    @hour = Hour.new(hour_params)

    respond_to do |format|
      if @hour.save
        format.html { redirect_to @hour, notice: "Hour was successfully created." }
        format.json { render :show, status: :created, location: @hour }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hours/1 or /hours/1.json
  def update
    respond_to do |format|
      if @hour.update(hour_params)
        format.html { redirect_to @hour, notice: "Hour was successfully updated." }
        format.json { render :show, status: :ok, location: @hour }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hours/1 or /hours/1.json
  def destroy
    @hour.destroy
    respond_to do |format|
      format.html { redirect_to hours_url, notice: "Hour was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def change_color
    @seat = Seat.find_by(id: params[:seat_id])
    if @seat.occupied == "NO"
      @seat.occupied = "YES"
    else
      @seat.occupied = "NO"
    end
    @seat.update(:number => @seat.number, :room_id => @seat.room_id, :hour_id => @seat.hour_id) 
    redirect_back(fallback_location: root_path)
  end


  def sort_list(list_to_sort)
    list_id_seats = []
    list_to_sort.each do |seat|
      list_id_seats.push(seat.id)
    end
    list_id_seats_sorted = list_id_seats.sort
    list_seats_sorted = []
    list_id_seats_sorted.each do |id_seat|
      seat = Seat.find_by(id: id_seat)
      list_seats_sorted.push(seat)
    end
    return list_seats_sorted
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hour
      @hour = Hour.find_by id: params.dig(:room_id)
    end

    # Only allow a list of trusted parameters through.
    def hour_params
      params.require(:hour).permit(:hourinterval, :room_id, :id)
    end
end
