class HomeController < ApplicationController
  def index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    begin
      @frequencia_atual = Frequencia.where(user_id:current_user.id, saida:nil).last
    rescue => exception
      @frequencia_atual = nil
    end
  end

  def new
    frequencia = Frequencia.new(user_id:current_user.id, entrada:Time.now, saida:nil)
    frequencia.save!
    redirect_to root_path
  end
  
  def update
    frequencia = Frequencia.where(user_id:current_user.id, saida:nil).last
    entrada = frequencia.entrada
    if Time.now > Time.new(entrada.year, entrada.month, entrada.day, entrada.hour + 1, entrada.min)
      if Time.new(entrada.year, entrada.month, entrada.day, 5).next_day > Time.now
        frequencia.update(saida: Time.now, fechou_o_ponto: true)
        redirect_to root_path
      else
        frequencia.update(saida: Time.now, fechou_o_ponto: false)
        redirect_to root_path
      end
    end
  end
end
