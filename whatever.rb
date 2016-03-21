def all_data
  @start_time = Time.now

  @sequences = []
  @genes = []
  @hits = []
  @assembly = Assembly.find_by_name(params[:name])
  @assembly.sequences.each do |s|
    @sequences << s
    s.genes.each do |g|
      @genes << g
      g.hits.each do |h|
        @hits << h
      end
    end
  end
