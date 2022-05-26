package com.fateczl.SistemaGerenciamentoWEB.persistence.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fateczl.SistemaGerenciamentoWEB.model.Produto;
import com.fateczl.SistemaGerenciamentoWEB.persistence.GenericDAO;
import com.fateczl.SistemaGerenciamentoWEB.persistence.InterfaceDAO.ProdutoDAO;

@Repository
public class ProdutoDAOImpl implements ProdutoDAO {

	@Autowired
	GenericDAO gDAO;

	@Override
	public void adicionarProduto(Produto p) throws SQLException, ClassNotFoundException {
		try {
			Connection c = gDAO.getConnection();

			String sql = "INSERT INTO Produto VALUES(?,?,?,?,?)"; // VERIFICAR SE ESSE É O NOME DA TABELA

			PreparedStatement ps = c.prepareStatement(sql);
			ps.setLong(1, p.getId()); // verificar tipo de dado no sql
			ps.setString(2, p.getNome());
			ps.setString(3, p.getDescricao());
			ps.setString(4, p.getNcmSh());
			ps.setDouble(5, p.getPreco()); // verificar tipo de dado no sql
			ps.executeUpdate(); // VERIFICAR SE FUNCIONA
			c.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean verificarDuplicidade(String ncmsh) throws SQLException, ClassNotFoundException {
		Connection c = gDAO.getConnection();
		String sql = "SELECT ncmsh FROM Cliente WHERE ncmsh = ?"; // VERIFICAR NOME DA  TABELA E DO NCMSH NO SQL
		
		PreparedStatement p = c.prepareStatement(sql);
		p.setString(1, ncmsh);
		ResultSet rs = p.executeQuery();
		if(rs.next()) {
			return false;
		}
		return true;
	}

}
