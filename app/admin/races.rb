# All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible.
# There can be different reasons for that:
#  - belongs_to _id and _type (polymorphic) columns are hidden in favor of their associations
#  - associations are hidden if they have no matchable model found (model not included or non-existant)
#  - they are part of a bigger plan in a plugin (Devise/Paperclip) and hidden by contract
# Some fields may be hidden depending on the section, if they aren't deemed suitable for display or edition on that section
#  - non-editable columns (:id, :created_at, ..) in edit sections
#  - has_many/has_one associations in list section (hidden by default for performance reasons)
# Fields may also be marked as read_only (and thus not editable) if they are not mass-assignable by current_user

# config.model Race do
#   # Found associations:
#   # Found columns:
#   field :id, :integer
#   field :name, :string
#   field :stage, :string
#   field :race_date, :datetime
#   field :place, :string
#   field :distance, :string
#   field :url, :string
#   field :created_at, :datetime
#   field :updated_at, :datetime
#   # Sections:
#   list do; end
#   export do; end
#   show do; end
#   edit do; end
#   create do; end
#   update do; end
#  end