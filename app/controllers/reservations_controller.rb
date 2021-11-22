class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]
  helper_method :sort_list

  # GET /reservations or /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1 or /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
    @hour = Hour.find_by(id: params[:hour_id])
    puts 'AQUI VIENE'
    @id = params[:hour_id]
    @tipo = @id.class
    puts "#{@tipo}"
    @seats = @hour.seats
    @seats
    id_movie = @hour.movie_id
    @movie = Movie.find_by(id: id_movie)
    @movie
    id_room = @hour.room_id
    @room = Room.find_by(id: id_room)
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations or /reservations.json
  def create
    @available_seats = [params.require(:reservation).permit(:seat_1)["seat_1"], params.require(:reservation).permit(:seat_2)["seat_2"], params.require(:reservation).permit(:seat_3)["seat_3"],
                        params.require(:reservation).permit(:seat_4)["seat_4"], params.require(:reservation).permit(:seat_5)["seat_5"], params.require(:reservation).permit(:seat_6)["seat_6"],
                        params.require(:reservation).permit(:seat_7)["seat_7"], params.require(:reservation).permit(:seat_8)["seat_8"], params.require(:reservation).permit(:seat_9)["seat_9"],
                        params.require(:reservation).permit(:seat_10)["seat_10"], params.require(:reservation).permit(:seat_11)["seat_11"], params.require(:reservation).permit(:seat_12)["seat_12"]]
    
    @seats = params.require(:reservation).permit(:string_id_seats)
    @seats = @seats["string_id_seats"].split(' ')

    @row = params.require(:reservation).permit(:row)["row"]

    @row_value = {"A" => (0..11).to_a, "B" => (12..23).to_a, "C" => (24..35).to_a, "D" => (36..47).to_a}
    counter = 0

    @row_value[@row].each do |position|
      puts "AQUI VIENE EL VALOR DE available seat"
      puts "#{@available_seats[counter]}"
      @seat = Seat.find_by(id: @seats[position])
      if @available_seats[counter] == "1"
        puts "AQUI VA EL SEAT"
        puts "#{@seat.occupied}"
        @seat.occupied = "YES"
        puts "#{@seat.occupied}"
        puts @seat.id
      end
      @seat.update(:number => @seat.number, :room_id => @seat.room_id, :hour_id => @seat.hour_id)
      counter += 1
    end


    puts 'AQUI VIENE hour_id:'
    puts "#{@seats}"
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: "Reservation was successfully created." }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
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
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation).permit(:seat_1, :seat_2, :seat_3, :seat_4,
                                          :seat_5, :seat_6, :seat_7, :seat_8,
                                          :seat_9, :seat_10, :seat_11, :seat_12, 
                                          :row, :hour_id, :movie_id, :room_id)
    end
end
