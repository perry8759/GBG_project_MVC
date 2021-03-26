package _00_init.util.init;

/*  
    程式說明：建立表格與設定初始測試資料。
*/
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Blob;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.product.model.CustomerCategoryBean;
import com.web.GBG_project.product.model.ProductBean;
import com.web.GBG_project.product.model.ProductCategoryBean;
import com.web.GBG_project.product.model.ProductDetailBean;
import com.web.GBG_project.product.model.ProductPicBean;
import com.web.GBG_project.product.model.ProductStausBean;
import com.web.GBG_project.shoppingCart.model.OrderDetailsBean;
import com.web.GBG_project.shoppingCart.model.OrderSatusBean;
import com.web.GBG_project.shoppingCart.model.OrdersBean;

import _00_init.util.HibernateUtils;

public class EDMTableResetHibernateGBG {
	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public void load() {

		String line = "";
		String path = "src/main/resources/mysqlData/";
		List<OrderSatusBean> orderStList = new ArrayList<>();
		List<CustomerCategoryBean> customerCategoryList = new ArrayList<>();
		List<ProductCategoryBean> productCategoryList = new ArrayList<>();
		List<ProductStausBean> productStausList = new ArrayList<>();
		List<ProductBean> productList = new ArrayList<>();
		List<OrdersBean> ordersList = new ArrayList<>();

		int count = 0;
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		// -------------讀取manage_status資料，寫入資料庫----------------
//				try (
//						InputStreamReader isr0 = new InputStreamReader(new FileInputStream(path + "manage_status.dat"), "UTF-8");
//						BufferedReader br = new BufferedReader(isr0);) {
//					tx = session.beginTransaction();
//					while ((line = br.readLine()) != null) {
//						String[] sa = line.split("\\|");
//						ManageStatusBean manageStatus = new ManageStatusBean();
//						manageStatus.setManage_status_id(null);
//						manageStatus.setManage_status_name(sa[0]);
//						session.save(manageStatus);
//
//						count++;
//						System.out.println("新增" + count + "筆記錄:" + sa[0]);
//					}
//					tx.commit();
//				} catch (Exception e) {
//					e.printStackTrace();
//					tx.rollback();
//				}
//				System.out.println("orderStList==>" + orderStList);
		
		
		// -------------讀取order_satus資料，寫入資料庫----------------
		try (
				// data2/order_satus.dat存放要新增的n筆資料
				// GBG_project_MVC\src\main\resources\mysqlData\customer_Category.dat
				InputStreamReader isr0 = new InputStreamReader(new FileInputStream(path + "order_satus.dat"), "UTF-8");
				BufferedReader br = new BufferedReader(isr0);) {
			tx = session.beginTransaction();
			while ((line = br.readLine()) != null) {
				String[] sa = line.split("\\|");
				OrderSatusBean orderStatus = new OrderSatusBean();
				orderStatus.setOrder_st_id(null);
				orderStatus.setOrder_stname(sa[0]);
				session.save(orderStatus);

				orderStList.add(orderStatus);

				count++;
				System.out.println("新增" + count + "筆記錄:" + sa[0]);
			}
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		System.out.println("orderStList==>" + orderStList);

		// -------------讀取customer_Category資料，寫入資料庫----------------
		try (
				// data2/order_satus.dat存放要新增的n筆資料
				InputStreamReader isr0 = new InputStreamReader(new FileInputStream(path + "customer_Category.dat"),
						"UTF-8");
				BufferedReader br = new BufferedReader(isr0);) {
			tx = session.beginTransaction();
			while ((line = br.readLine()) != null) {
				String[] sa = line.split("\\|");
				CustomerCategoryBean customerCategory = new CustomerCategoryBean();
				customerCategory.setCustomer_category_id(null);
				customerCategory.setCustomer_category_name(sa[0]);
				session.save(customerCategory);
				customerCategoryList.add(customerCategory);
				count++;
				System.out.println("新增" + count + "筆記錄:" + sa[0]);
			}
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		System.out.println("customerCategoryList==>" + customerCategoryList);

		// -------------讀取product_Category資料，寫入資料庫----------------
		try (InputStreamReader isr0 = new InputStreamReader(new FileInputStream(path + "product_Category.dat"),
				"UTF-8"); BufferedReader br = new BufferedReader(isr0);) {
			tx = session.beginTransaction();
			while ((line = br.readLine()) != null) {
				String[] sa = line.split("\\|");
				ProductCategoryBean productCategory = new ProductCategoryBean();
				productCategory.setCategory_id(null);
				productCategory.setCategory_name(sa[0]);
				session.save(productCategory);
				productCategoryList.add(productCategory);
				count++;
				System.out.println("新增" + count + "筆記錄:" + sa[0]);
			}
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		System.out.println("customerCategoryList==>" + customerCategoryList);

		// -------------讀取product_status資料，寫入資料庫----------------
		try (InputStreamReader isr0 = new InputStreamReader(new FileInputStream(path + "product_status.dat"), "UTF-8");
				BufferedReader br = new BufferedReader(isr0);) {
			tx = session.beginTransaction();
			while ((line = br.readLine()) != null) {
				String[] sa = line.split("\\|");
				ProductStausBean productStaus = new ProductStausBean();
				productStaus.setProduct_stid(null);
				productStaus.setProduct_st_name(sa[0]);
				session.save(productStaus);
				productStausList.add(productStaus);
				count++;
				System.out.println("新增" + count + "筆記錄:" + sa[0]);
			}
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		System.out.println("productStausList==>" + productStausList);

		// -------------讀取Product資料，寫入資料庫----------------
		// 由"product.dat"逐筆讀入product表格內的初始資料，然後依序新增到product表格中
		File file = new File(path + "product.dat");
		try (FileInputStream fis = new FileInputStream(file);
				InputStreamReader isr = new InputStreamReader(fis, "UTF-8");
				BufferedReader br = new BufferedReader(isr);) {
			while ((line = br.readLine()) != null) {
				System.out.println("line=" + line);
				// 去除 UTF8_BOM: \uFEFF
				if (line.startsWith(UTF8_BOM)) {
					line = line.substring(1);
				}
				String[] token = line.split("\\|");
				ProductBean product = new ProductBean();
				product.setProduct_id(null);
				product.setProduct_title(token[0]);
				product.setProduct_price(Double.parseDouble(token[1].trim()));
				product.setProductno(token[2]);
				product.setProduct_textdetails(token[3]);
				// 取得商品描述.txt檔
//						product.setProduct_textdetails(token[3]);
//				product.setCustomerCategoryBean(customerCategoryList.get(Integer.parseInt(token[4])));
//				product.setProductCategoryBean(productCategoryList.get(Integer.parseInt(token[5])));
//				product.setProductStausBean(productStausList.get(Integer.parseInt(token[6])));
				// 暫時不會用到
//						product.setCustomerCategoryId((token[4].trim());
//						product.setProductCategoryId((token[5].trim());
//						product.setProductStausId(token[6]);
				product.setProduct_purchases(Integer.parseInt(token[7].trim()));
				product.setAverage_score(Double.parseDouble(token[8].trim()));
				Timestamp onSaleTime = new Timestamp(System.currentTimeMillis());
				product.setOnSaleTime(onSaleTime);

				try {
					tx = session.beginTransaction();
					CustomerCategoryBean customerCategoryBean = session.get(CustomerCategoryBean.class,
							Integer.parseInt(token[4].trim()));
					product.setCustomerCategoryBean(customerCategoryBean);

					ProductCategoryBean productCategoryBean = session.get(ProductCategoryBean.class,
							Integer.parseInt(token[5].trim()));
					product.setProductCategoryBean(productCategoryBean);

					ProductStausBean productStausBean = session.get(ProductStausBean.class,
							Integer.parseInt(token[6].trim()));
					product.setProductStausBean(productStausBean);

					session.save(product);
					productList.add(product);

					tx.commit();
				} catch (Exception ex) {
					if (tx != null)
						tx.rollback();
				}
				System.out.println("新增一筆Product紀錄");
			}
			// 印出資料新增成功的訊息
			System.out.println("Product資料新增成功");
		} catch (Exception e) {
			System.err.println("新建Product表格時發生IO例外: " + e.getMessage());
		}

		// -------------讀取Product_detail資料，寫入資料庫----------------
		try (InputStreamReader isr0 = new InputStreamReader(new FileInputStream(path + "product_detail.dat"), "UTF-8");
				BufferedReader br = new BufferedReader(isr0);) {
			while ((line = br.readLine()) != null) {
				// 未處理BOM字元，若有需要，請自行加入
				String[] sa = line.split("\\|");
				try {
					tx = session.beginTransaction();
					ProductDetailBean productDetail = new ProductDetailBean();
					productDetail.setProduct_detail_id(null);

					ProductBean productBean = session.get(ProductBean.class, Integer.parseInt(sa[0].trim()));
					productDetail.setProductBean(productBean);

					productDetail.setProduct_color(sa[1]);
					productDetail.setProduct_size(sa[2]);
					productDetail.setProduct_stock(Integer.parseInt(sa[3]));

					session.save(productDetail);
					session.flush();
					tx.commit();
					count++;
					System.out.println("新增" + count + "筆記錄:" + sa[1]);
					// break;
				} catch (Exception e) {
					e.printStackTrace();
					if (tx != null) {
						tx.rollback();
					}
				} finally {

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// -------------讀取product_pic資料，寫入資料庫----------------
		try (InputStreamReader isr0 = new InputStreamReader(new FileInputStream(path + "product_pic.dat"), "UTF-8");
				BufferedReader br = new BufferedReader(isr0);) {
			while ((line = br.readLine()) != null) {
				// 未處理BOM字元，若有需要，請自行加入
				String[] sa = line.split("\\|");
				try {
					tx = session.beginTransaction();
					ProductPicBean productPic = new ProductPicBean();

					productPic.setProduct_pic_id(null);
					ProductBean productBean = session.get(ProductBean.class, Integer.parseInt(sa[0].trim()));
					productPic.setProductBean(productBean);
//							productPic.setProductBean(productList.get(Integer.parseInt(sa[0])));
					productPic.setProduct_pic_seq(Integer.parseInt(sa[2]));

					// --------------處理Blob(圖片)欄位----------------
					File picf = new File(sa[1]);
					System.out.println(picf.getAbsolutePath());
					long size = picf.length();
					InputStream is = new FileInputStream(picf);
					Blob picb = Hibernate.getLobCreator(session).createBlob(is, size);
					productPic.setProduct_pic_img(picb);

					session.save(productPic);
					session.flush();
					tx.commit();
					count++;
					System.out.println("新增" + count + "筆記錄:" + sa[1]);
					// break;
				} catch (Exception e) {
					e.printStackTrace();
					if (tx != null) {
						tx.rollback();
					}
				} finally {

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// -------------讀取order資料，寫入資料庫----------------
				try (
						// data2/order_satus.dat存放要新增的n筆資料
						InputStreamReader isr0 = new InputStreamReader(new FileInputStream(path + "order.dat"), "UTF-8");
						BufferedReader br = new BufferedReader(isr0);) {
					tx = session.beginTransaction();
					while ((line = br.readLine()) != null) {
						String[] sa = line.split("\\|");
						OrdersBean order = new OrdersBean();
						order.setOseq_id(null);
						order.setOrder_id(sa[0]);
						MemberBean memberBean = session.get(MemberBean.class, Integer.parseInt(sa[1].trim()));
						order.setMemberBean(memberBean);
						order.setReceive_men(sa[2]);
						order.setShipping_address(sa[3]);
						Date date = new Date(System.currentTimeMillis());  //之後再測試寫時間
						order.setOrder_date(date);
						order.setShipping_style(sa[5]);
						OrderSatusBean status = session.get(OrderSatusBean.class, Integer.parseInt(sa[1].trim()));
						order.setOrderSatusBean(status);
						session.save(order);
						ordersList.add(order);

						count++;
						System.out.println("新增" + count + "筆記錄:" + sa[0]);
					}
					tx.commit();
				} catch (Exception e) {
					e.printStackTrace();
					tx.rollback();
				}
				System.out.println("ordersList==>" + ordersList);
				// -------------讀取order_details資料，寫入資料庫----------------
				try (InputStreamReader isr0 = new InputStreamReader(new FileInputStream(path + "order_details.dat"), "UTF-8");
						BufferedReader br = new BufferedReader(isr0);) {
					while ((line = br.readLine()) != null) {
						// 未處理BOM字元，若有需要，請自行加入
						String[] sa = line.split("\\|");
						try {
							tx = session.beginTransaction();
							OrderDetailsBean orderDetail=new OrderDetailsBean();
							orderDetail.setOdseq_id(null);
							orderDetail.setOrder_amount(Integer.parseInt(sa[0]));
							OrdersBean order=session.get(OrdersBean.class, Integer.parseInt(sa[1].trim()));
							orderDetail.setOrdersBean(order);
							ProductDetailBean productDetail=session.get(ProductDetailBean.class, Integer.parseInt(sa[2].trim()));
							orderDetail.setProductDetailBean(productDetail);

							session.save(orderDetail);
							session.flush();
							tx.commit();
							count++;
							System.out.println("新增" + count + "筆記錄:" + sa[1]);
							// break;
						} catch (Exception e) {
							e.printStackTrace();
							if (tx != null) {
								tx.rollback();
							}
						} finally {

						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
//========================================================
		HibernateUtils.close();
	}
}
