class Nugget < ActiveRecord::Base
  # Relationships
  # -----------------------------------
  belongs_to :user
  
  # new columns need to be added here to be writable through mass assignment
  # whenever you create or update a model in your controllers by using mass assignment
  attr_accessible :audience, :topic, :body
  
  # Validations
  # -----------------------------------
  validates_presence_of :audience, :on => :create, :message => "needs to speak to a group"
  validates_presence_of :topic, :on => :create, :message => "needs a topic"
  validates_presence_of :body, :on => :create, :message => "needs a body"
  validates_length_of   :audience, :within => 2..30, :on => :create, :message => "must be shorter than 30 characters"
  validates_length_of   :topic, :within => 2..50, :on => :create, :message => "must be shorter than 30 characters"
  
  default_scope :order => "created_at DESC"
end
