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
@posts = Assembly.all
if params[:search]
  @posts = Assembly.search(params[:search]).order("created_at DESC")
else
  @posts = Assembly.all.order('created_at DESC')
end






    # @start_time = Time.now
    # @assembly = Assembly.find_by_name(params[:name])
    #   @sequences = @assembly.sequences
    #   @hits = []
    #   @hits = @assembly.hits.order(percent_similarity: :desc)
    # @memory_used = memory_in_mb
  end

  def results
    render "results"
  end





  private def memory_in_mb
    `ps -o rss -p #{$$}`.strip.split.last.to_i / 1024
  end
end
