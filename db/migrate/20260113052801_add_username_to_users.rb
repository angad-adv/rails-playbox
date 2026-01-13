class AddUsernameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
  end
end

# naming convention to edit columns

# rails generate migration AddUsernameToUsers username:string -> with index (rails generate migration AddIndexToUsersEmail)
# rails generate migration RemoveUsernameFromUsers username:string
# rails generate migration RenameUsernameToUserbroINUsers

# convention to adding index, references etc

# rails generate migration AddIndexToUsersEmail - rails generate migration AddIndexToUsersEmail

