require 'csv'

class PagesController < ApplicationController
  def home
    csv_options = { col_sep: ';', encoding: "bom|utf-8", headers: :first_row }
    filepath = 'app/controllers/Ano-2020.csv'
    despesas = []
    CSV.foreach(filepath, csv_options) do |row|
      despesa = { uf: row['sgUF'],
                  name: row['txNomeParlamentar'],
                  date: row['datEmissao'],
                  provider: row['txtFornecedor'],
                  amount: row['vlrLiquido'],
                  url: row['urlDocumento']
                }
      despesas << despesa      
    end
  end
end
