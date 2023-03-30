package model;

public class DBTest {

	public static void main(String[] args) {
//		PostDAO dao = new PostDAO();
////		dao.list(2,3);
////		System.out.println(dao.total());
//		 System.out.println(dao.read(235));
		UserDAO dao = new UserDAO();
		System.out.println(dao.read("useraa"));
	}

}
