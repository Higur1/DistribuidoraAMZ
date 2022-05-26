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

			String sql = "INSERT INTO Produto (nome, descricao, ncmSh, preco) VALUES(?,?,?,?)"; // VERIFICAR SE ESSE É O NOME DA TABELA

			PreparedStatement ps = c.prepareStatement(sql);
		
			ps.setString(1, p.getNome());
			ps.setString(2, p.getDescricao());
			ps.setString(3, p.getNcmSh());
			ps.setDouble(4, p.getPreco()); // verificar tipo de dado no sql
			ps.executeUpdate(); // VERIFICAR SE FUNCIONA
			c.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean verificarDuplicidade(String ncmsh) throws SQLException, ClassNotFoundException {
		Connection c = gDAO.getConnection();
		String sql = "SELECT ncmSh FROM Produto WHERE ncmSh = ?"; // VERIFICAR NOME DA  TABELA E DO NCMSH NO SQL
		
		PreparedStatement p = c.prepareStatement(sql);
		p.setString(1, ncmsh);
		ResultSet rs = p.executeQuery();
		if(rs.next()) {
			return false;
		}
		return true;
	}

}
