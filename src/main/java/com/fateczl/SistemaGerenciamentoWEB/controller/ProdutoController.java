package com.fateczl.SistemaGerenciamentoWEB.controller;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fateczl.SistemaGerenciamentoWEB.model.Produto;
import com.fateczl.SistemaGerenciamentoWEB.persistence.DAO.ProdutoDAOImpl;

@Controller
public class ProdutoController {
	
	@Autowired
	ProdutoDAOImpl pDAO;
	
	@RequestMapping(name="Produto", value="/Produto", method=RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		return new ModelAndView();
	}
	
	@RequestMapping(name = "Produto", value = "Produto", method = RequestMethod.POST) // verificar name e value
	public ModelAndView produtoAdicionar(ModelMap model, @RequestParam Map<String, String> param) {
		String botaoAdicionar = param.get("botaoAdicionar");
		String erro = "";
		try {
			if (!botaoAdicionar.isEmpty()) {
				Produto p = new Produto();
				
				p.setId(null); // criar variavel para somar os ids
				p.setNome(param.get("nomeProduto"));
				p.setDescricao(param.get("categoria"));
				p.setNcmSh(param.get("ncmsh"));
				p.setPreco(Double.parseDouble(param.get("preco")));
				
				if (pDAO.verificarDuplicidade(p.getNcmSh())) {
					pDAO.adicionarProduto(p);
				} else {
					System.out.println("duplicado");
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			erro = e.getMessage();
		} finally {
			model.addAttribute("erro", erro);
		}
		return new ModelAndView();
	}
}
