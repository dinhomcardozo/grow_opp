class SubSegmentsController < ApplicationController
  before_action :set_sub_segment, only: %i[ show edit update destroy ]

  # GET /sub_segments or /sub_segments.json
  def index
    @sub_segments = SubSegment.all
  end

  # GET /sub_segments/1 or /sub_segments/1.json
  def show
  end

  # GET /sub_segments/new
  def new
    @sub_segment = SubSegment.new
  end

  # GET /sub_segments/1/edit
  def edit
  end

  # POST /sub_segments or /sub_segments.json
  def create
    @sub_segment = SubSegment.new(sub_segment_params)

    respond_to do |format|
      if @sub_segment.save
        format.html { redirect_to @sub_segment, notice: "Sub segment was successfully created." }
        format.json { render :show, status: :created, location: @sub_segment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sub_segment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_segments/1 or /sub_segments/1.json
  def update
    respond_to do |format|
      if @sub_segment.update(sub_segment_params)
        format.html { redirect_to @sub_segment, notice: "Sub segment was successfully updated." }
        format.json { render :show, status: :ok, location: @sub_segment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sub_segment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_segments/1 or /sub_segments/1.json
  def destroy
    @sub_segment.destroy!

    respond_to do |format|
      format.html { redirect_to sub_segments_path, status: :see_other, notice: "Sub segment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_segment
      @sub_segment = SubSegment.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def sub_segment_params
      params.expect(sub_segment: [ :sub_segment_name, :status, :segment_id ])
    end
end
