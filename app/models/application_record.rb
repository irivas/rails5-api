class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def as_json(*)
    super.except('created_at', 'updated_at')
  end
end
