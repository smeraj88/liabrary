class Subjects < ActiveRecord::Migration[5.0]
  
 def self.up
      
      create_table :subjects do |t|
         t.column :title, :string
      end
	
      Subject.create :title => "Physics"
      Subject.create :title => "Mathematics"
      Subject.create :title => "Chemistry"
      Subject.create :title => "Psychology"
      Subject.create :title => "Geography"
   

   def self.down
      drop_table :subjects
   end
 end
 end