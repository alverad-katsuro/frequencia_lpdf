class RelatorioController < ApplicationController
  def index
    @frequencias = Frequencia.all.reverse
  end
end
