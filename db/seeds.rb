require 'csv'

csv_options = { col_sep: ';', encoding: "bom|utf-8", headers: :first_row }
filepath = 'db/Ano-2020.csv'
uf = "MG"
csv_data = []
lala = 0
CSV.foreach(filepath, csv_options) do |row|
  if row['sgUF'] == uf
    data = { uf: uf,
             id_cadastro: row['ideCadastro'],
             name: row['txNomeParlamentar'],
             date: row['datEmissao'],
             provider: row['txtFornecedor'],
             amount: row['vlrLiquido'],
             url: row['urlDocumento']
    }
    csv_data << data
    lala += 1
    p lala
  end
end
congressmen = []
expenses = []
id = 0
n = 0
csv_data.each do |data|
  if congressmen.any? { |element| element[:name] == data[:name] }
    congressman_id = congressmen.find {|congressman| congressman[:name] == data[:name] }[:id]
  else 
    id += 1
    congressman = { id: id,
                    uf: uf,
                    id_cadastro: data[:id_cadastro],
                    name: data[:name],
                    created_at: Time.now.utc,
                    updated_at: Time.now.utc
    }
    congressmen << congressman
    congressman_id = id
  end
  n += 1
  expense = { id: n,
              date: data[:date],
              provider: data[:provider],
              amount: data[:amount],
              url: data[:url],
              congressman_id: congressman_id,
              created_at: Time.now.utc,
              updated_at: Time.now.utc
  }
  expenses << expense
end

Congressman.insert_all(congressmen)
Expense.insert_all(expenses)
