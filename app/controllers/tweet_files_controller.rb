class TweetFilesController < ApplicationController
  before_action :set_tweet_file, only: [:show, :edit, :update, :destroy]

  # GET /tweet_files
  # GET /tweet_files.json
  def index
    @tweet_files = TweetFile.all
  end

  # GET /tweet_files/1
  # GET /tweet_files/1.json
  def show
  end

  # GET /tweet_files/new
  def new
    @tweet_file = TweetFile.new
  end

  # GET /tweet_files/1/edit
  def edit
  end

  # POST /tweet_files
  # POST /tweet_files.json
  def create
    @tweet_file = TweetFile.new(tweet_file_params)

    respond_to do |format|
      if @tweet_file.save
        format.html { redirect_to @tweet_file, notice: 'Tweet file was successfully created.' }
        format.json { render :show, status: :created, location: @tweet_file }
      else
        format.html { render :new }
        format.json { render json: @tweet_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweet_files/1
  # PATCH/PUT /tweet_files/1.json
  def update
    respond_to do |format|
      if @tweet_file.update(tweet_file_params)
        format.html { redirect_to @tweet_file, notice: 'Tweet file was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet_file }
      else
        format.html { render :edit }
        format.json { render json: @tweet_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweet_files/1
  # DELETE /tweet_files/1.json
  def destroy
    @tweet_file.destroy
    respond_to do |format|
      format.html { redirect_to tweet_files_url, notice: 'Tweet file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet_file
      @tweet_file = TweetFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_file_params
      params.require(:tweet_file).permit(:text, :date, :coordinates)
    end
end
