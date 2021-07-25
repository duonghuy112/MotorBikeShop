package com.tromic.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.tromic.connection.DatabaseConnection;
import com.tromic.dao.ProductDao;
import com.tromic.persistence.Product;
import com.tromic.persistence.ProductRawData;
import com.tromic.service.CategoryService;
import com.tromic.service.SupplierService;
import com.tromic.service.impl.CategoryServiceImpl;
import com.tromic.service.impl.SupplierServiceImpl;
import com.tromic.utils.SqlUtils;

public class ProductDaoImpl implements ProductDao {
	
	private static CategoryService categoryService;
	private static SupplierService supplierService;
	
	static {
		categoryService = new CategoryServiceImpl();
		supplierService = new SupplierServiceImpl();
	}

	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public ProductDaoImpl() {
		conn = DatabaseConnection.getConnection();
	}
	
	@Override
	public List<Product> getAll() {
		List<Product> list = new ArrayList<>();
		String sql = "SELECT * \r\n"
				+ "FROM [Product]";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt(1));
				product.setCategory(categoryService.get(rs.getInt(2)));
				product.setSupplier(supplierService.get(rs.getInt(3)));
				product.setName(rs.getString(4));
				product.setPrice(rs.getDouble(5));
				product.setDescription(rs.getString(6));
				product.setImage(rs.getString(7));
				product.setStatus(rs.getInt(8));
				product.setCreateDate(rs.getDate(9));
				list.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return list;
	}

	@Override
	public List<ProductRawData> getAllPagging(int pageIndex, int pageSize) {
		List<ProductRawData> list = new ArrayList<>();
		String sql = "SELECT * \r\n"
				+ "FROM [Product] \r\n"
				+ "ORDER BY [Product_id] \r\n"
				+ "OFFSET ? ROWS \r\n"
				+ "FETCH NEXT ? ROWS ONLY";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, (pageIndex - 1) * pageSize);
			pst.setInt(2, pageSize);
			rs = pst.executeQuery();
			while (rs.next()) {
				ProductRawData product = new ProductRawData();
				transformer(product);
				list.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return list;
	}

	@Override
	public List<ProductRawData> getByCategoryId(int categoryId, int pageIndex, int pageSize) {
		List<ProductRawData> list = new ArrayList<>();
		String sql = "SELECT * \r\n"
				+ "FROM [Product] \r\n"
				+ "WHERE [Category_id] = ?\r\n"
				+ "ORDER BY [Product_id] \r\n"
				+ "OFFSET ? ROWS \r\n"
				+ "FETCH NEXT ? ROWS ONLY";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, categoryId);
			pst.setInt(2, (pageIndex - 1) * pageSize);
			pst.setInt(3, pageSize);
			rs = pst.executeQuery();
			while (rs.next()) {
				ProductRawData product = new ProductRawData();
				transformer(product);
				list.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return list;
	}

	@Override
	public List<ProductRawData> getBySupplierId(int supplierId, int pageIndex, int pageSize) {
		List<ProductRawData> list = new ArrayList<>();
		String sql = "SELECT * \r\n"
				+ "FROM [Product] \r\n"
				+ "WHERE [Supplier_id] = ?\r\n"
				+ "ORDER BY [Product_id] \r\n"
				+ "OFFSET ? ROWS \r\n"
				+ "FETCH NEXT ? ROWS ONLY";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, supplierId);
			pst.setInt(2, (pageIndex - 1) * pageSize);
			pst.setInt(3, pageSize);
			rs = pst.executeQuery();
			while (rs.next()) {
				ProductRawData product = new ProductRawData();
				transformer(product);
				list.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return list;
	}

	@Override
	public List<ProductRawData> seachByName(String productName, int pageIndex, int pageSize) {
		List<ProductRawData> list = new ArrayList<>();
		String sql = "SELECT * \r\n"
				+ "FROM [Product] \r\n"
				+ "WHERE [Name] LIKE ?\r\n"
				+ "ORDER BY [Product_id] \r\n"
				+ "OFFSET ? ROWS \r\n"
				+ "FETCH NEXT ? ROWS ONLY";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, "%" + productName + "%");
			pst.setInt(2, (pageIndex - 1) * pageSize);
			pst.setInt(3, pageSize);
			rs = pst.executeQuery();
			while (rs.next()) {
				ProductRawData product = new ProductRawData();
				transformer(product);
				list.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return list;
	}

	@Override
	public ProductRawData get(int productId) {
		ProductRawData product = null;
		String sql = "SELECT * \r\n"
				+ "FROM [Product] \r\n"
				+ "WHERE [Product_id] = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, productId);
			rs = pst.executeQuery();
			if (rs.next()) {
				product = new ProductRawData();
				transformer(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return product;
	}

	@Override
	public boolean save(Product product) {
		boolean isSaved = false;
		String sql = "INSERT INTO [dbo].[Product]\r\n"
				+ "           ([Category_id]\r\n"
				+ "           ,[Supplier_id]\r\n"
				+ "           ,[Name]\r\n"
				+ "           ,[Price]\r\n"
				+ "           ,[Description]\r\n"
				+ "           ,[Image]\r\n"
				+ "           ,[Status]\r\n"
				+ "           ,[CreateDate])\r\n"
				+ "     VALUES\r\n"
				+ "           (?, ?, ?, ?, ?, ?, ?, GETDATE())";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, product.getCategory().getId());
			pst.setInt(2, product.getSupplier().getId());
			pst.setString(3, product.getName());
			pst.setDouble(4, product.getPrice());
			pst.setString(5, product.getDescription());
			pst.setString(6, product.getImage());
			pst.setInt(7, product.getStatus());
			isSaved = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(pst);
		}
		return isSaved;
	}

	@Override
	public boolean update(Product product) {
		boolean isUpdated = false;
		String sql = "UPDATE [Product]\r\n"
				+ "   SET [Category_id] = ?\r\n"
				+ "      ,[Supplier_id] = ?\r\n"
				+ "      ,[Name] = ?\r\n"
				+ "      ,[Price] = ?\r\n"
				+ "      ,[Description] = ?\r\n"
				+ "      ,[Status] = ?\r\n"
				+ " WHERE [Product_id] = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, product.getCategory().getId());
			pst.setInt(2, product.getSupplier().getId());
			pst.setString(3, product.getName());
			pst.setDouble(4, product.getPrice());
			pst.setString(5, product.getDescription());
			pst.setInt(6, product.getStatus());
			pst.setInt(7, product.getId());
			isUpdated = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(pst);
		}
		return isUpdated;
	}

	@Override
	public boolean delete(int productId) {
		boolean isDeleted = false;
		String sql = "DELETE FROM [Product]\r\n"
				+ " WHERE [Product_id] = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, productId);
			isDeleted = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(pst);
		}
		return isDeleted;
	}

	@Override
	public int countPage(int pageSize) {
		int countAll = getAll().size();
		int numberOfPage = countAll / pageSize;
		if (countAll % pageSize != 0) {
			numberOfPage++;
		}
		return numberOfPage;
	}

	@Override
	public int countPageCategory(int categoryId, int pageSize) {
		int countAll = getAll().stream()
				.filter(p -> p.getCategory().getId() == categoryId)
				.collect(Collectors.toList())
				.size();
		int numberOfPage = countAll / pageSize;
		if (countAll % pageSize != 0) {
			numberOfPage++;
		}
		return numberOfPage;
	}

	@Override
	public int countPageSupplier(int supplierId, int pageSize) {
		int countAll = getAll().stream()
				.filter(p -> p.getSupplier().getId() == supplierId)
				.collect(Collectors.toList())
				.size();
		int numberOfPage = countAll / pageSize;
		if (countAll % pageSize != 0) {
			numberOfPage++;
		}
		return numberOfPage;
	}

	@Override
	public int countAllSearchName(String productName) {
		String sql = "SELECT COUNT(*) \r\n"
				+ "FROM [Product] \r\n"
				+ "WHERE [Name] LIKE ?";
		int count = 0;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, "%" + productName + "%");
			rs = pst.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return count;
	}

	@Override
	public int countPageSearchName(String productName, int pageSize) {
		int countAll = countAllSearchName(productName);
		int numberOfPage = countAll / pageSize;
		if (countAll % pageSize != 0) {
			numberOfPage++;
		}
		return numberOfPage;
	}
	
	private void transformer(ProductRawData product) throws SQLException {
		product.setId(rs.getInt(1));
		product.setCategoryId(rs.getInt(2));
		product.setSupplierId(rs.getInt(3));
		product.setName(rs.getString(4));
		product.setPrice(rs.getDouble(5));
		product.setDescription(rs.getString(6));
		product.setImage(rs.getString(7));
		product.setStatus(rs.getInt(8));
		product.setCreateDate(rs.getDate(9));
	}
}
