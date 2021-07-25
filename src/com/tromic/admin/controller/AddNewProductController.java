package com.tromic.admin.controller;

import java.io.IOException;
import java.nio.file.Path;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.tromic.persistence.Category;
import com.tromic.persistence.Product;
import com.tromic.persistence.Supplier;
import com.tromic.service.CategoryService;
import com.tromic.service.ProductService;
import com.tromic.service.SupplierService;
import com.tromic.service.impl.CategoryServiceImpl;
import com.tromic.service.impl.ProductServiceImpl;
import com.tromic.service.impl.SupplierServiceImpl;

@WebServlet("/Admin/AddNewProduct")
public class AddNewProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ProductService productService;
	private static CategoryService categoryService;
	private static SupplierService supplierService;
	
	static {
		productService = new ProductServiceImpl();
		categoryService = new CategoryServiceImpl();
		supplierService = new SupplierServiceImpl();
	}
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		String name = request.getParameter("name");
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		Category category = categoryService.get(categoryId);
		int supplierId = Integer.parseInt(request.getParameter("supplierId"));
		Supplier supplier = supplierService.get(supplierId);
		double price = Double.parseDouble(request.getParameter("price"));
		String description = request.getParameter("description");
		int status = Integer.parseInt(request.getParameter("status"));

		Part part = request.getPart("image");
		String realPath = request.getServletContext().getRealPath("/view/admin");
		String fileName = Path.of(part.getSubmittedFileName()).getFileName().toString();
		part.write(realPath + "/assets/images/product/" + fileName);
		
		Product product = new Product();
		product.setName(name);
		product.setCategory(category);
		product.setSupplier(supplier);
		product.setPrice(price);
		product.setDescription(description);
		product.setStatus(status);
		product.setImage(fileName);
		if (productService.save(product)) {
			response.sendRedirect("ProductList");
		}
	}

}
