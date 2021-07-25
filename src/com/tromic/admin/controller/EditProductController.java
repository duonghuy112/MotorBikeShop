package com.tromic.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.admin.common.Constant;
import com.tromic.persistence.Category;
import com.tromic.persistence.Product;
import com.tromic.persistence.Supplier;
import com.tromic.service.CategoryService;
import com.tromic.service.ProductService;
import com.tromic.service.SupplierService;
import com.tromic.service.impl.CategoryServiceImpl;
import com.tromic.service.impl.ProductServiceImpl;
import com.tromic.service.impl.SupplierServiceImpl;

@WebServlet("/Admin/EditProduct")
public class EditProductController extends HttpServlet {
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
	    
		int productId = Integer.parseInt(request.getParameter("productId"));
		Product product = productService.get(productId);
		request.setAttribute("product", product);
		request.getRequestDispatcher(Constant.Path.PRODUCT_DETAIL).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
		int productId = Integer.parseInt(request.getParameter("productId"));
		String name = request.getParameter("name");
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		Category category = categoryService.get(categoryId);
		int supplierId = Integer.parseInt(request.getParameter("supplierId"));
		Supplier supplier = supplierService.get(supplierId);
		double price = Double.parseDouble(request.getParameter("price"));
		String description = request.getParameter("description");
		int status = Integer.parseInt(request.getParameter("status"));
		
		Product product = new Product();
		product.setId(productId);
		product.setCategory(category);
		product.setSupplier(supplier);
		product.setName(name);
		product.setPrice(price);
		product.setDescription(description);
		product.setStatus(status);
		
		if (productService.update(product)) {
			response.sendRedirect("ProductList");
		}
	}

}
