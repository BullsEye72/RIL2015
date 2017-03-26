module QuotesHelper

  def quote_buttons quote
    output = '<div class="change-states-forms">'
    if quote.quote_states.last == QuoteState.find_by_name('brouillon')
      output += '<a href="'+quote_path(quote, format: :pdf)+'" target="_blank" class="btn btn-primary">'
      output += '  <span class="glyphicon glyphicon glyphicon-print" aria-hidden="true"> </span>'
      output += '  Valider'
      output += '</a> '
      output += '<a href="'+edit_quote_path+'" class="btn btn-primary">'
      output += '  <span class="glyphicon glyphicon-edit" aria-hidden="true"> </span>'
      output += '  Editer'
      output += '</a>'
      output += <<-HTML
                <button class="btn-danger" data-toggle="modal" data-target="#delete">
                  <span class="glyphicon glyphicon-remove" aria-hidden="true"> </span>
                  Supprimer
                </button>
      HTML
      return raw(output)
    end
    if quote.quote_states.last == QuoteState.find_by_name('en attente')
      output += render('accept_or_decline')
    end

    output += '<a href="'+quote_path(quote, format: :pdf)+'" target="_blank" class="btn btn-default">' #, format: :pdf
    output += '  <span class="glyphicon glyphicon glyphicon-print" aria-hidden="true"> </span>'
    output += '  Imprimer'
    output += '</a>'
    output += '</div>'
    raw(output)
  end

end
