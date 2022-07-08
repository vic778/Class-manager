class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  after_initialize :set_default_role
  # after_initialize :set_default_class_room
  belongs_to :role
  has_many :class_room
  has_many :rooms, through: :class_room


  validates :username, presence: true, uniqueness: true
  validates :password_confirmation, presence: true, on: :create
  # validates :phone, presence: true

  def update_role(role_name)
    self.role = Role.find_or_create_by(name: role_name)
    save
  end

  # def update_room(room_name)
  #   self.room = Room.find_by(name: room_name)
  #   save
  # end

  def generate_jwt
    JWT.encode({ id: id, exp: 2.days.from_now.to_i }, 'vicSecret')
  end

  private

  def set_default_role
    self.role ||= Role.find_by(name: 'student') if role.nil?
  end

  # def set_default_class_room
  #   update(room_id: ClassRoom.find_or_create_by(name: 'pool').id) if class_room_id.nil?
  # end
end
