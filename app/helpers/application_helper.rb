module ApplicationHelper
  
  def pagamento_tag(pagamento)
    if pagamento.confirmado
			link_para('Sim', 'pagamentos', 'Cancelar', pagamento.id)
		else
			link_para('Não', 'pagamentos', 'Confirmar', pagamento.id)
		end
  end
  
  def fatura_tag(fatura)
    return "Não" unless fatura.situacao == Fatura::SITUACAO[:fechada]
    if fatura.confirmado
  			link_para('Sim', 'faturas', 'Cancelar', fatura.id)
  		else
  			link_para('Não', 'faturas', 'Confirmar', fatura.id)
		end
  end
  
  private
  
    def link_para(label, controller, action, id)
      link_to label, { :controller => controller, :action => action.downcase, :id => id }, :confirm => "#{action} o pagamento?", :method => :put, :remote => true
    end
end
