package com.journal.AudienceDAO;

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
public class AudienceDAO {
	private SqlMapClient smc;

	public List<String> gettherespectivemovies(String ccom) throws IOException, SQLException {
		Reader rd = Resources.getResourceAsReader("sqlMapClient.xml");
		smc = SqlMapClientBuilder.buildSqlMapClient(rd);
		return smc.queryForList("Audience.getallmovies", ccom);
	}

	public int insertUser(AudiencePOJO audience) throws SQLException, IOException {
		Reader rd = Resources.getResourceAsReader("sqlMapClient.xml");
		smc = SqlMapClientBuilder.buildSqlMapClient(rd);
		smc.insert("Audience.insertaudience", audience);
		return 1;
	}

	public List<AudiencePOJO> selectAllAudience() throws SQLException, IOException {
		Reader rd = Resources.getResourceAsReader("sqlMapClient.xml");
		smc = SqlMapClientBuilder.buildSqlMapClient(rd);
		return smc.queryForList("Audience.selectallaudience");
	}

	public AudiencePOJO selectspecificuser(int id) throws IOException, SQLException {
		Reader rd = Resources.getResourceAsReader("sqlMapClient.xml");
		smc = SqlMapClientBuilder.buildSqlMapClient(rd);
		return (AudiencePOJO) smc.queryForObject("Audience.selectspecificid",id);
	}
}
