class AddColumnBoards < ActiveRecord::Migration[5.0]
  def change
    add_column(:boards, :good, :integer, null:false, default: 0)
  end
end
