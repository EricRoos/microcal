# frozen_string_literal: true

class Event
  class TaskCreated < self
    after_create :award_points
    def task
      LineItem.find(meta['id'])
    end

    def award_points
      PointAward.create(user:, event: self, amount: 10)
    end
  end
end
