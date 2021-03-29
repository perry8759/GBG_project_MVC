package _00_init.util;

import _00_init.util.init.ACTTableResetHibernateGBG;
import _00_init.util.init.EDMTableResetHibernateGBG;
import _00_init.util.init.InitValCreate;
import _00_init.util.init.MemberTableResetHibernateGBG;

public class InitData {
	public static void main(String[] args) {
		InitValCreate parameter=new InitValCreate();
		MemberTableResetHibernateGBG member=new MemberTableResetHibernateGBG();
		ACTTableResetHibernateGBG act=new ACTTableResetHibernateGBG();
		EDMTableResetHibernateGBG edm=new EDMTableResetHibernateGBG();
		
		parameter.load();
		member.load();
		member.loadFollower();
		act.load();
		act.follow();
		edm.load();
	}
}
