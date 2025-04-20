import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 620,
      child:
          transactions
                  .isEmpty //Função se não tiver registro
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Nenhum Registro',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 150,
                      child: Image.asset(
                        'assests\\images\\zzz.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              )
              : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (ctx, index) {
                  final tr = transactions[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: ListTile(
                      //Valores
                      leading: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 75, 70, 214),
                          borderRadius: BorderRadius.circular(
                            8,
                          ), // arredonda levemente
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: FittedBox(
                          child: Text(
                            'R\$ ${tr.value.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      //Descrição
                      title: Text(
                        tr.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${tr.date.day}/${tr.date.month}/${tr.date.year}',
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => onRemove(tr.id),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
