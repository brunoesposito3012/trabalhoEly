package org.libertas;

import java.sql.PreparedStatement;
import java.util.LinkedList;

public class PessoaDao {
	
	private static LinkedList<Pessoa> lista = new LinkedList<Pessoa>();
	
	public void inserir(Pessoa p) {
		lista.add(p);
	}
	public LinkedList<Pessoa> listar(){
		return lista;
		LinkedList<Pessoa> lista=  new LinkedList<Pessoa>();
		Conexao con = new Conexao();
		try {
			String sql = "DELETE FROM pessoa"
						+ "WHERE idpessoa=?";
			PreparedStatement prep = con.getConnection().prepareStatement(sql);
			prep.setInt(1, p.getIdpessoa());
			prep.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.desconecta();
	}
}
