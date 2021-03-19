package com.web.GBG_project.product.dao.impl;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.GBG_project.member.dao.MemberDao;
import com.web.GBG_project.member.model.ManageStatusBean;
import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.product.dao.ProductDao;
import com.web.GBG_project.product.model.CustomerCategoryBean;
import com.web.GBG_project.product.model.ProductBean;
import com.web.GBG_project.product.model.ProductCategoryBean;
import com.web.GBG_project.product.model.ProductCommentBean;
import com.web.GBG_project.product.model.ProductDetailBean;
import com.web.GBG_project.product.model.ProductPicBean;
import com.web.GBG_project.product.model.ProductStausBean;

@Repository
public class ProductDaoImpl implements ProductDao {
	// 排行榜列出幾項商品
	final int TOP = 5;

	@Autowired
	SessionFactory factory;

	@Autowired
	MemberDao memberDao;

	@Override
	public ProductBean selectProductById(int productId) {
		Session session =factory.getCurrentSession();
		String hql="FROM ProductBean WHERE product_id=:pId";
		return (ProductBean) session.createQuery(hql)
				.setParameter("pId", productId)
				.getSingleResult();
	}
	// 取得所有商品
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getAllProducts() {
		String hql = "FROM ProductBean";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	// 以id搜尋商品
	@Override
	public ProductBean getProductById(int productId) {
		Session session = factory.getCurrentSession();
		return session.get(ProductBean.class, productId);
	}

	// 列出新上架商品
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getNewSaleProducts() {
		String hql = "FROM ProductBean pb ORDER BY pb.onSaleTime desc";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setFirstResult(0).setMaxResults(TOP).getResultList();
	}

	// 列出熱門銷售商品
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getHotProducts() {
		String hql = "FROM ProductBean pb ORDER BY pb.product_purchases desc";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setFirstResult(0).setMaxResults(TOP).getResultList();
	}

	// 列出客群商品
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getProductsByCustomerCategory(int ccid) {
//		String hql="FROM ProductBean pb WHERE pb.customer_category_id = :id"; 語法錯誤
		String hql = "FROM ProductBean WHERE customer_category_id = :id";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("id", ccid).getResultList();
	}

	// 列出符合客群商品分類的商品
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getProductsByCustomerProductCategory(int ccid, int pcid) {
		String hql = "FROM ProductBean WHERE customer_category_id = :ccid AND category_id = :pcid";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("ccid", ccid).setParameter("pcid", pcid).getResultList();
	}

	// 用商品ID找到商品細項
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductDetailBean> getProductsDetailsByProductId(int pid) {
		String hql = "FROM ProductDetailBean WHERE product_id = :id";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("id", new ProductBean(pid)).getResultList();
	}

	// 用商品ID找到商品尺寸
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getPSizesByProductId(int pid) {
		String hql = "SELECT DISTINCT product_size FROM ProductDetailBean WHERE product_id = :id";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("id", new ProductBean(pid)).getResultList();
	}

	// 用商品ID找到商品顏色
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getPColorsByProductId(int pid) {
		String hql = "SELECT DISTINCT product_color FROM ProductDetailBean WHERE product_id = :id";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("id", new ProductBean(pid)).getResultList();
	}

	@Override
	public void addProductComment(ProductCommentBean productCommentBean) {
		Session session = factory.getCurrentSession();
		session.save(productCommentBean);
	}

	// 用商品ID找到商品評論
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductCommentBean> getProductCommentByProductId(int pid) {
		String hql = "FROM ProductCommentBean WHERE product_id = :id ORDER BY comment_date DESC";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("id", new ProductBean(pid)).getResultList();
	}

	// 計算總商品評論數
	@Override
	public int totalComments(int pId) {
		String hql = "FROM ProductCommentBean WHERE product_id = :id";
		Session session = factory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<ProductCommentBean> clist = session.createQuery(hql).setParameter("id", new ProductBean(pId))
				.getResultList();
		return clist.size();
	}

	// 新增評論後的平均商品分數
	@Override
	public Double avgProductScore(int pId) {
		String hql = "SELECT AVG(comment_value) FROM ProductCommentBean WHERE product_id = :id";
		Session session = factory.getCurrentSession();
		String s = session.createQuery(hql).setParameter("id", new ProductBean(pId)).getSingleResult().toString();
		Double avg = Double.parseDouble(s);
		return avg;
	}

	// 取出所有CustomerCategoryBean
	@SuppressWarnings("unchecked")
	@Override
	public List<CustomerCategoryBean> getAllCustomerCategory() {
		String hql = "FROM CustomerCategoryBean";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	// 找出所有商品分類
	@SuppressWarnings("unchecked")
	public List<ProductCategoryBean> getAllProductCategory() {
		String hql = "FROM ProductCategoryBean";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	@Override
	public void updateProductScore(int pId, Double newScore) {
		String hql = "UPDATE ProductBean SET average_score = :newScore WHERE product_id = :id";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("id", pId).setParameter("newScore", newScore).executeUpdate();
	}

	@Override
	public ProductStausBean getProductStausById(int productStatusId) {
		Session session = factory.getCurrentSession();
		return session.get(ProductStausBean.class, productStatusId);
	}

	@Override
	public CustomerCategoryBean getCustomerCategoryById(int customerCategoryId) {
		Session session = factory.getCurrentSession();
		return session.get(CustomerCategoryBean.class, customerCategoryId);
	}

	@Override
	public ProductCategoryBean getProductCategoryById(int productCategoryId) {
		Session session = factory.getCurrentSession();
		return session.get(ProductCategoryBean.class, productCategoryId);
	}

	@Override
	public void addProduct(ProductBean productBean) {
		Session session = factory.getCurrentSession();
		session.save(productBean);
	}

	// 找出商品狀態
	@SuppressWarnings("unchecked")
	public List<ProductStausBean> getAllProductStatus() {
		String hql = "FROM ProductStausBean";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	// update商品
	public void updateProduct(ProductBean product) {
		Session session = factory.getCurrentSession();
//		ProductBean origin=getProductById(product.getProduct_id());
		//使用get得到物件為被persistence，然而關閉session，會成為脫管對象
//		session.evict(origin);
//		session.merge(product); //=> Ditach
		session.update(product); //=> NonUniqueObjectException
//		session.saveOrUpdate(product);//=> NonUniqueObjectException
	}
	// 新增商品細項
	@Override
	public void addProductDetail(ProductDetailBean productDetailBean) {
		System.out.println("==========dao儲存pdb之前==========");
		Session session = factory.getCurrentSession();
		session.save(productDetailBean);
	}
	@SuppressWarnings("unchecked")
	// 用客群類型上下架搜尋商品
	@Override
	public List<ProductBean> listProductByCondition(int customerCategoryId, int productStatusId, String sort) {
		String hql0 = "";
		// String hql0 = "FROM ProductBean WHERE product_stid=:pstId AND
		// customer_category_id=:ccId ORDER BY product_price :sort";
		if (customerCategoryId == -1 || productStatusId == -1) {
			hql0 = "FROM ProductBean WHERE  product_stid=:pstId OR customer_category_id=:ccId ORDER BY product_price ";
		} else {
			hql0 = "FROM ProductBean WHERE  product_stid=:pstId AND customer_category_id=:ccId ORDER BY product_price ";
		}
		String hql = hql0 + sort;
		Session session = factory.getCurrentSession();
		return session.createQuery(hql)
				.setParameter("ccId", getCustomerCategoryById(customerCategoryId))
				.setParameter("pstId", getProductStausById(productStatusId))
				.getResultList();
	}
	@SuppressWarnings("unchecked")
	@Override // 以會員id找商品評論
	public List<ProductCommentBean> getProductCommentByMember(MemberBean member){
		String hql= "FROM ProductCommentBean WHERE  member_id=:member";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql)
				.setParameter("member", member)
				.getResultList();
	}
	@Override // 修改商品狀態
	public void updateProductStatus(int productId, ProductStausBean status) {
		String hql = "UPDATE ProductBean SET product_stid = :newStatus WHERE product_id = :id";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("id", productId).setParameter("newStatus", status).executeUpdate();
	}
	@Override // 更新上架時間
	public void updateOnSaleDate(int productId, Timestamp times) {
		String hql = "UPDATE ProductBean SET onSaleTime = :newTime WHERE product_id = :id";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("id", productId).setParameter("newTime", times).executeUpdate();
	}
	// update商品細項 //有時間希望能在ProductBean使用fetch=EAGER的狀態下更新productDetailBean
	public void updateProductDetail(ProductDetailBean productDetail) {
		String hql = "UPDATE ProductDetailBean SET product_color = :newColor, "
				+ "product_size =:newSize, "
				+ "product_stock=:newStock WHERE product_detail_id = :id";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("newColor", productDetail.getProduct_color())
								.setParameter("newSize", productDetail.getProduct_size())
								.setParameter("newStock", productDetail.getProduct_stock())
								.setParameter("id", productDetail.getProduct_detail_id())
								.executeUpdate();
	}
	// =======================測試未成功=========================
	@SuppressWarnings("unchecked")
	@Override //搜尋商品
	public List<ProductBean> searchProducts(String keyword,int productCategoryId, int productStatusId){
		String hql ="FROM ProductBean WHERE  product_title LIKE :keyword OR category_id=:pcId OR product_stid=:psId ORDER BY product_price";
		if (productCategoryId != -1 & productStatusId != -1) {
			hql = "FROM ProductBean WHERE  product_title LIKE :keyword AND category_id=:pcId AND product_stid=:psId  ORDER BY product_price";
		} else if(productCategoryId != -1 & productStatusId == -1){
			hql = "FROM ProductBean WHERE  product_title LIKE :keyword AND category_id=:pcId OR product_stid=:psId  ORDER BY product_price";
		} else if(productCategoryId == -1 & productStatusId != -1) {
			hql = "FROM ProductBean WHERE  product_title LIKE :keyword AND product_stid=:psId OR category_id=:pcId ORDER BY product_price";
		}
		Session session = factory.getCurrentSession();
		System.out.println("===========================================================");
		System.out.println(hql);
		return session.createQuery(hql)
				.setParameter("keyword", "%"+keyword+"%")
				.setParameter("pcId", getProductCategoryById(productCategoryId))
				.setParameter("psId", getProductStausById(productStatusId))
				.getResultList();
	}
	
	@Override // 以細項id找細項
	public ProductDetailBean getProductDetailById(int detailId) {
		Session session = factory.getCurrentSession();
		return session.get(ProductDetailBean.class, detailId);
	}



	@Override
	public ProductCommentBean getProductCommentById(int commentId) {
		Session session = factory.getCurrentSession();
		return session.get(ProductCommentBean.class, commentId);
	}

	@Override
	public ProductPicBean getProductPicById(int picId) {
		Session session = factory.getCurrentSession();
		return session.get(ProductPicBean.class, picId);
	}

	// 計算商品圖片總數
	@Override
	public int countPictures(int pId) {
		String hql = "FROM ProductPicBean WHERE product_id = :id";
		Session session = factory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<ProductPicBean> piclist = session.createQuery(hql).setParameter("id", new ProductBean(pId))
				.getResultList();
		return piclist.size();
	}

	// 用商品ID找到商品照片
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductPicBean> getProductsPicByProductId(int pid) {
		String hql = "FROM ProductPicBean WHERE product_id = :id";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("id", new ProductBean(pid)).getResultList();
	}

	// 得到客群名稱
	@Override
	public String getCustomerCategoryName(int ccid) {
		String hql = "SELECT customer_category_name CustomerCategoryBean WHERE customer_category_id = :id";
		Session session = factory.getCurrentSession();
		return (String) session.createQuery(hql).setParameter("id", ccid).getSingleResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllCustomerCategoryName() {
		String hql = "SELECT ccb.customer_category_name FROM CustomerCategoryBean ccb";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	// 找出客群分類中有哪些商品分類
	@SuppressWarnings("unchecked")
	public List<ProductCategoryBean> getProductCategoryByCCId(int ccId) {
		String hql = "SELECT DISTINCT FROM ProductBean pb WHERE pb.customer_category_id=:id";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("id", ccId).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getProductsByCustomerCategory(String customerCategory) {
		String hql = "FROM CustomerCategoryBean ccb WHERE ccb.customer_category_name = :customerCategory";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("customerCategory", customerCategory).getResultList();
	}

//	@SuppressWarnings("unchecked")
//	@Override
//	public List<String> getAllProductCategory() {
//		String hql = "SELECT pcb.category_name FROM ProductCategoryBean pcb";
//		Session session = factory.getCurrentSession();
//		return session.createQuery(hql).getResultList();
//	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> getCustomerCategoryIdByCustomerCategoryName(String customerCategory) {
		String hql = "SELECT DISTINCT ccb.customer_category_id FROM CustomerCategoryBean ccb "
				+ "WHERE ccb.customer_category_name = :customerCategory";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("customerCategory", customerCategory).getResultList();
	}

	// 需修改
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllProductCategoryByCustomerCategory(int customerCategoryId) {
		String hql = "SELECT DISTINCT       pcb.category_name FROM ProductCategoryBean pcb   "
				+ "WHERE customer_category_id = :ccId";

		String hql2 = "FROM ProductCategoryBean";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("ccId", customerCategoryId).getResultList();
		return session.createQuery(hql2).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getProductsByProductCategory(String productCategory) {
		String hql = "FROM ProductCategoryBean pcb WHERE pcb.category_name = :productCategory";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("productCategory", productCategory).getResultList();
	}

//	ProductDetailBean
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getProductDetailSizeByProductId(int productId) {
		String hql = "SELECT DISTINCT pdb.product_size FROM ProductDetailBean pdb  WHERE pdb.product_id = :product_id";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("product_id", productId).getResultList();
	}

	@Override
	public int getProductTotalStockByProductId() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberBean getMemberById(int memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ManageStatusBean getManageStatusById(int manageId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberBean> getMemberList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ManageStatusBean> getManageList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductCommentBean> getProductComments(Integer memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductCommentBean> getMemberComments(Integer memberId) {
		// TODO Auto-generated method stub
		return null;
	}

}
