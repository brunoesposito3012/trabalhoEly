package org.trabalhos;

	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.Statement;
	import java.util.LinkedList;

	public class LivrosDao {

		public void salvar(Livros l) {
			if (l.getIdlivro()>0) {
				editar(l);
			} else {
				adicionar(l);
			}
		}

		public void adicionar(Livros l) {

			Conexao con = new Conexao();

			try {
				String sql = "INSERT INTO livros (titulo, autor, editora, anopublicacao) "
						+ "VALUES (?, ?, ?, ?)";
				PreparedStatement prep = con.getConnection().prepareStatement(sql);
				prep.setString(1, l.getTitulo());
				prep.setString(2, l.getAutor());
				prep.setString(3, l.getEditora());
				prep.setString(4, l.getAnoPublicacao());
				prep.execute();
			} catch (Exception e) {
				e.printStackTrace();
	}

			con.desconecta();
	}


		public void editar(Livros l) {
			Conexao con = new Conexao();
			try {
				String sql = " UPDATE livros SET "
						+ " titulo = ?, autor = ?, "
						+ " editora = ?, anopublicacao = ?, "
						+ " WHERE idlivro = ?";
				PreparedStatement prep = con.getConnection().prepareStatement(sql);
				prep.setString(1, l.getTitulo());
				prep.setString(2, l.getAutor());
				prep.setString(3, l.getEditora());
				prep.setString(4, l.getAnoPublicacao());
				prep.execute();		
			}	catch (Exception e) {
				e.printStackTrace();
			}
			con.desconecta();
		}


		public void excluir(Livros l) {
			Conexao con = new Conexao();
			try {
				String sql = " DELETE FROM livros "
						+ " WHERE id = ?";
				PreparedStatement prep = con.getConnection().prepareStatement(sql);
				prep.setInt(1, l.getIdlivro());
				prep.execute();		
			}	catch (Exception e) {
				e.printStackTrace();
			}
			con.desconecta();
		}


		public LinkedList<Livros> listar(){
			LinkedList<Livros> lista = new LinkedList<Livros>();
			Conexao con = new Conexao();
			try {
				String sql = "SELECT * FROM Livros";
				Statement sta = con.getConnection().createStatement();
				ResultSet res = sta.executeQuery(sql);
				while (res.next()) {
					Livros l = new Livros();
					l.setIdlivro(res.getInt("idlivro"));
					l.setTitulo(res.getString("titulo"));
					l.setAutor(res.getString("autor"));
					l.setEditora(res.getString("Editora"));
					l.setAnoPublicacao(res.getString("anopublicacao"));
					lista.add(l);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			con.desconecta();
			return lista;
		}


		public Livros consultar(int idlivro) {
			Livros l = new Livros();
			Conexao con = new Conexao();
			try {
				String sql = "SELECT * FROM Livros WHERE idlivro = " + idlivro;
				Statement sta = con.getConnection().createStatement();
				ResultSet res = sta.executeQuery(sql);
				if (res.next()) {
					l.setIdlivro(res.getInt("idlivro"));
					l.setTitulo(res.getString("titulo"));
					l.setAutor(res.getString("autor"));
					l.setEditora(res.getString("editora"));
					l.setAnoPublicacao(res.getString("anopublicacao"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			con.desconecta();
			return l;
		}
	}