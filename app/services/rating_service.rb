module RatingService
  def self.get_ratings(dev)
    completed_projects = []
    ratings = []

    # Query for the all projects the Dev was accepted
    dev_accepted_bids = dev.bids.where(status: 1)
    # Filter the query for the all projects completed by the Dev
    dev_accepted_bids.each do |bid|
      if bid.project.status == "completed"
        completed_projects.push(bid)
      end
    end
    # Filter the query for the all projects that rated the Dev
    completed_projects.each do |bid|
      if bid.project.rating != nil
        ratings.push(bid.project.rating)
      end
    end
    ratings
  end

  def self.calculate_overall_rating(rating, dev)
    completed_projects = []
    ratings = []

    # Query for the all projects the Dev was accepted
    dev_accepted_bids = dev.bids.where(status: 1)

    # Filter the query for the all projects completed by the Dev
    dev_accepted_bids.each do |bid|
      if bid.project.status == "completed"
        completed_projects.push(bid)
      end
    end

    # Filter the query for the all projects that rated the Dev
    completed_projects.each do |bid|
      if bid.project.rating != nil
        ratings.push(bid.project.rating.rate)
      end
    end
    # Calculate new overall average rating and save to User table
    updated_overall_rating = ratings.sum / ratings.size.to_f
  end
end
