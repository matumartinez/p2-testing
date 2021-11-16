class ShowRoomsController < ApplicationController
  before_action :set_show_room, only: %i[ show edit update destroy ]

  # GET /show_rooms or /show_rooms.json
  def index
    @show_rooms = ShowRoom.all
  end

  # GET /show_rooms/1 or /show_rooms/1.json
  def show
  end

  # GET /show_rooms/new
  def new
    @show_room = ShowRoom.new
  end

  # GET /show_rooms/1/edit
  def edit
  end

  # POST /show_rooms or /show_rooms.json
  def create
    @show_room = ShowRoom.new(show_room_params)

    respond_to do |format|
      if @show_room.save
        format.html { redirect_to @show_room, notice: "Show room was successfully created." }
        format.json { render :show, status: :created, location: @show_room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @show_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /show_rooms/1 or /show_rooms/1.json
  def update
    respond_to do |format|
      if @show_room.update(show_room_params)
        format.html { redirect_to @show_room, notice: "Show room was successfully updated." }
        format.json { render :show, status: :ok, location: @show_room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @show_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /show_rooms/1 or /show_rooms/1.json
  def destroy
    @show_room.destroy
    respond_to do |format|
      format.html { redirect_to show_rooms_url, notice: "Show room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show_room
      @show_room = ShowRoom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def show_room_params
      params.fetch(:show_room, {})
    end
end
