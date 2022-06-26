class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  after_initialize :set_default_role
  belongs_to :role

  # validates :username, presence: true, uniqueness: true
  # validates :phone, presence: true

  def update_role(role_name)
    self.role = Role.find_or_create_by(name: role_name)
    save
  end

  def generate_jwt
    JWT.encode({ id: id, exp: 2.days.from_now.to_i }, 'vicSecret')
  end

  private

  def set_default_role
    self.role ||= Role.find_by(name: 'student') if role.nil?
  end
end
