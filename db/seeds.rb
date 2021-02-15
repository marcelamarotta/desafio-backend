# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_options = { col_sep: ';', encoding: "bom|utf-8", headers: :first_row }
filepath = 'db/Ano-2020.csv'
uf = "MG"
n = 0
CSV.foreach(filepath, csv_options) do |row|
  if row['sgUF'] == uf
    if Congressman.exists?( name: row['txNomeParlamentar'] )
      congressman = Congressman.find_by name: row['txNomeParlamentar']
    else
      congressman = Congressman.create( uf: uf, name: row['txNomeParlamentar'] )
    end
    expense = Expense.create( date: row['datEmissao'],
                            provider: row['txtFornecedor'],
                            amount: row['vlrLiquido'],
                            url: row['urlDocumento'],
                            congressman_id: congressman[:id]
                            )
  end
  n += 1
  puts n
end