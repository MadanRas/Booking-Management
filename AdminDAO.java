package com.journal.AdminDAO;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.journal.AdminPOJO.AdminPOJO;
import com.journal.AudiencePOJO.AudiencePOJO;

@Repository
public class AdminDAO {

	private SqlMapClient smc;

	public boolean checkUserThere(int id) throws SQLException, IOException {
		Reader rd = Resources.getResourceAsReader("sqlMapClient.xml");
		smc = SqlMapClientBuilder.buildSqlMapClient(rd);
		AdminPOJO a1 = (AdminPOJO) smc.queryForObject("Admin.checkadminexists",id);
		if(a1 != null) {
			return true;
		}else {
			return false;
		}
	}

	public int insertadmin(AdminPOJO a1) throws IOException, SQLException {

		Reader rd = Resources.getResourceAsReader("sqlMapClient.xml");
		smc = SqlMapClientBuilder.buildSqlMapClient(rd);
		smc.insert("Admin.insertAdmin",a1);
		return 1;
	}



}
