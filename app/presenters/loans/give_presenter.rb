class Loans::GivePresenter < BasePresenter
  def loan_type
    text_green 'Prestamo otorgado'
  end

  def due_date_tag
    txt =  due_date < today ? text_red(template.l due_date) : template.l(due_date)

    "<span class='muted'>Vence el</span>: #{txt}".html_safe  unless is_paid?
  end

  def payment_path
    template.new_charge_loan_payment_path(id)
  end

  def state_tag
    if 'paid' == state
      text_green 'Cobrado'
    else
      'Pendiente'
    end
  end

  def interest_path
    template.new_charge_interest_loan_payment_path(id)
  end

  def payment_link
    link_to payment_path, class: 'btn btn-success', data: { target: '#payment-form' } do
      "#{icon('icon-plus-sign')} Cobrar prestamo".html_safe
    end
  end

  def interest_link
    link_to interest_path, class: 'btn btn-success', data: { target: '#interest-form' } do
      "#{icon('icon-plus-sign')} Cobrar intereses".html_safe
    end
  end

end

