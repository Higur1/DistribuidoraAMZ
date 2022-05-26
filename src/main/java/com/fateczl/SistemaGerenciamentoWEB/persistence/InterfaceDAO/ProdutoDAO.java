package com.fateczl.SistemaGerenciamentoWEB.persistence.InterfaceDAO;

import java.sql.SQLException;

import com.fateczl.SistemaGerenciamentoWEB.model.Produto;

public interface ProdutoDAO {
	public void adicionarProduto(Produto p) throws SQLException, ClassNotFoundException;
	public boolean verificarDuplicidade(String nchsh) throws SQLException, ClassNotFoundException;
}
