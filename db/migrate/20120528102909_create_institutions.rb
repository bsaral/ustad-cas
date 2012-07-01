class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :name, limit: 100
      #t.string :ip, default: '1.2.3.4'
      t.string :route_to

      t.timestamps
    end
  end
end
