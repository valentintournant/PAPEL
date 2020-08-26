class DeleteUserFromCohorts < ActiveRecord::Migration[6.0]
  def change
    remove_reference :cohorts, :user, index: true, foreign_key: true
  end
end
