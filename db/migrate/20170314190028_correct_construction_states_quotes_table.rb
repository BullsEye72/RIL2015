class CorrectConstructionStatesQuotesTable < ActiveRecord::Migration
  def change
    rename_column :construction_states_quotes, :construction_states_id, :construction_state_id
    rename_column :construction_states_quotes, :quotes_id, :quote_id
  end
end
