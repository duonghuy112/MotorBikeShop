package com.tromic.controller;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.common.Constant;
import com.tromic.persistence.Category;
import com.tromic.persistence.Product;
import com.tromic.persistence.Supplier;
import com.tromic.service.CategoryService;
import com.tromic.service.ProductService;
import com.tromic.service.SupplierService;
import com.tromic.service.impl.CategoryServiceImpl;
import com.tromic.service.impl.ProductServiceImpl;
import com.tromic.service.impl.SupplierServiceImpl;

@WebServlet("/Category")
public class FilterByCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ProductService productService;
	private static CategoryService categoryService;
	private static SupplierService supplierService;
	
	static {
		productService = new ProductServiceImpl();
		categoryService = new CategoryServiceImpl();
		supplierService = new SupplierServiceImpl();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		int pageIndex = 1;
		if (request.getParameter("pageIndex") != null) {
			pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
		}
		final int PAGE_SIZE = 9;
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		int totalPage = productService.countPageCategory(categoryId, PAGE_SIZE);
		
		List<Product> listProduct = productService.getByCategoryId(categoryId, pageIndex, PAGE_SIZE);
		List<Category> listCategory = categoryService.getAll();
		List<Supplier> listSupplier = supplierService.getAll();
		
		int countAllProduct = productService.getAll().size();
		int countFoundProduct = productService.getAll()
				.stream()
				.filter(p -> p.getCategory().getId() == categoryId)
				.collect(Collectors.toList())
				.size();
								
		request.setAttribute("categoryId", categoryId);
		request.setAttribute("listSupplier", listSupplier);
		request.setAttribute("listCategory", listCategory);
		request.setAttribute("listProduct", listProduct);
		request.setAttribute("countAllProduct", countAllProduct);
		request.setAttribute("countFoundProduct", countFoundProduct);
		request.setAttribute("categoryId", categoryId);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("pageIndex", pageIndex);
		request.getRequestDispatcher(Constant.Path.CATEGORY).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
