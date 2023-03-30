package SpringMVC.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.SharedSessionContract;
import org.hibernate.Transaction;

import SpringMVC.Bean.Address;
import SpringMVC.Bean.User;
import SpringMVC.util.HibernateUtil;

public class DaoImpl implements Dao {

	SessionFactory factory = HibernateUtil.getSessionFactory();

	// This method for register
	public boolean insertUser(User user) {

		Transaction transaction = null;
		try (Session session = factory.openSession()) {
			transaction = session.beginTransaction();
			session.saveOrUpdate(user);
			transaction.commit();
			session.close();

		} catch (Exception e) {
			if (transaction != null) {
				System.out.println("Hello insert method ");
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return true;
	}

	// This method for login
	@Override
	public boolean userVaildate(String email, String password) {
		Session session = factory.openSession();
		Query query = session.createQuery("from User where email=:email and password=:password");
		query.setParameter("email", email);
		query.setParameter("password", password);
		if (!query.list().isEmpty()) {
			System.out.println("\n-> " + email + " User is exist.");
			session.close();
			return true;
		} else {
			System.out.println("\n-> " + email + " User is not exist.");
			session.close();
			return false;
		}
	}

	// This method for set user data into session
	public User userGet(String email) {

		User user = null;
		try (Session session = factory.openSession()) {
			Query query = session.createQuery("from User where email=:email");
			query.setParameter("email", email);
			user = (User) query.uniqueResult();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<User> getEmployees() {
		List<User> userData;
		try (Session session = factory.openSession()) {
			Query query = session.createQuery("from User");
			userData = query.list();
			return userData;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public boolean deleteEmployee(int id) {
		Transaction transaction = null;
		try (Session session = factory.openSession()) {
			transaction = session.beginTransaction();
			User userId = session.get(User.class, id);
			session.delete(userId);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	@Override
	public List<Address> userAddress(int id) {

		try (Session session = factory.openSession()) {

			Query query = session.createQuery("FROM Address a WHERE a.user.user_fk =:id");
			query.setParameter("id", id);
			List<Address> result = query.list();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List removeId(int userId) {
		Transaction transaction = null;
		try (Session session = factory.openSession()) {
			System.out.println("inside remove address");
			// get address id of user from database
			Query query = session.createQuery("select Aid FROM Address WHERE user_fk = :userId");
			query.setParameter("userId", userId);
			List list = query.list();
			System.out.println("list in remove" + list);
			return list;

		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	@Override
	public void updateAddress(List<Address> addList) {

		System.out.println("inside address update");
		Transaction tx = null;

		try (Session session = factory.openSession()) {

			tx = session.beginTransaction();
			List addressId = new ArrayList();
			
			// get addressid
			for (int j = 0; j < addList.size(); j++) {
				addressId.add(addList.get(j).getAddressId());
			}

			// get existing id
			List existingId = removeId( addList.get(0).getUser().getId());
			for (int k = 0; k < existingId.size(); k++) {
				if (!addressId.contains(String.valueOf(existingId.get(k)))) {
					int addrId = (Integer) existingId.get(k);
					Query query = session.createQuery("DELETE from  Address WHERE Aid = :id");
					query.setParameter("id", addrId);
					query.executeUpdate();
				}
			}

			for (int i = 0; i < addList.size(); i++) {
				String addrId = addList.get(i).getAddressId();
				if (addrId.equals("")) {
					session.save(addList.get(i));
				} else {
					addList.get(i).setAid(Integer.parseInt(addrId));
					session.update(addList.get(i));
				}
			}
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
		}
	}
/*
	public List removeId(Session session, int userId) {
		Transaction transaction = null;
		System.out.println("inside remove address");

		// get address id of user from database
		Query query = session.createQuery("select Aid FROM Address WHERE user_fk = :userId");
		query.setParameter("userId", userId);
		List list = query.list();
		System.out.println("list in remove" + list);
		return list;

	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public void updateAddress(List<Address> addList) {

		System.out.println("inside address update");
		Transaction tx = null;
		Session session = factory.openSession();
		try {

			tx = session.beginTransaction();
			List addressId = new ArrayList();

			// get addressid
			for (int j = 0; j < addList.size(); j++) {
				addressId.add(addList.get(j).getAddressId());
			}
			// get existing id
			List existingId = removeId(session,addList.get(0).getUser().getId());
			for (int k = 0; k < existingId.size(); k++) {
				if (!addressId.contains(String.valueOf(existingId.get(k)))) {
					int addrId = (Integer) existingId.get(k);
					Query query = session.createQuery("DELETE from  Address WHERE Aid = :id");
					query.setParameter("id", addrId);
					query.executeUpdate();
				}
			}

			for (int i = 0; i < addList.size(); i++) {
				String addrId = addList.get(i).getAddressId();
				if (addrId.equals("")) {
					session.save(addList.get(i));
				} else {
					addList.get(i).setAid(Integer.parseInt(addrId));
					session.update(addList.get(i));
				}
				tx.commit();
			}
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			session.close();
		}

	}*/

}
