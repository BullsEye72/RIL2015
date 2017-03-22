class RenameQuotesQuoteStatesToQuoteStatesQuotes < ActiveRecord::Migration
  def change
    rename_table :quotes_quote_states, :quote_states_quotes
    rename_column :quote_states_quotes, :quotes_id, :quote_id
    rename_column :quote_states_quotes, :quote_states_id, :quote_state_id
  end
end
