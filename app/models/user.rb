def set_admin
  update(admin: true)
end

def remove_admin
  update(admin: false)
end

has_many :projects, dependent: :destroy
