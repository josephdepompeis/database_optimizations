class ReportsController < ApplicationController
  helper_method :memory_in_mb

  def all_data
    @start_time = Time.now
    @assembly = Assembly.find_by_name(params[:name])
      @sequences = @assembly.sequences
      @hits = []
      @hits = @assembly.hits.order(percent_similarity: :desc)

    @memory_used = memory_in_mb
  end

  def search
@search = "hello"
@results = Assembly.all
if params[:search]
  # @results = Assembly.search(params[:search]).order("created_at DESC")
  @results = Assembly.find_by_name(params[:search])
  @sequences = @results.sequences
  @hits = []
  @hits = @results.hits.order(percent_similarity: :desc)

else
  @results = Assembly.all.order('created_at DESC')
end






    # @start_time = Time.now
    # @assembly = Assembly.find_by_name(params[:name])
    #   @sequences = @assembly.sequences
    #   @hits = []
    #   @hits = @assembly.hits.order(percent_similarity: :desc)
    # @memory_used = memory_in_mb
  end

  def results
    # if params[:search]
    #   @results = Assembly.search(params[:search]).order("created_at DESC")
    # else
    #   @results = Assembly.all.order('created_at DESC')
    # end
    if params[:search]
      # @results = Assembly.search(params[:search]).order("created_at DESC")

      @results = Assembly.find_by_name(params[:search])
      @sequences = @results.sequences
      @hits = []
      @hits = @results.hits.order(percent_similarity: :desc)
      byebug
    else
      @results = Assembly.all.order('created_at DESC')
    end




  end





  private def memory_in_mb
    `ps -o rss -p #{$$}`.strip.split.last.to_i / 1024
  end
end
