package com.journal;

import java.applet.AudioClip;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.journal.AdminDAO.AdminDAO;
import com.journal.AdminPOJO.AdminPOJO;
import com.journal.AudienceDAO.AudienceDAO;
import com.journal.AudiencePOJO.AudiencePOJO;

@org.springframework.stereotype.Controller
public class Controller {

	@Autowired
	AdminDAO dao;
	@Autowired
	AudienceDAO audienceDAO;

	@GetMapping("/audienceform")
	public String getsuccess() {
		return "AudienceForm";
	}

	@RequestMapping("/")
	public String view() {
		return "AdminForm";
	}

	@RequestMapping("/registerpage")
	public String registerpage() {
		return "registerpage";
	}

	@ResponseBody
	@GetMapping("/checkifadminexists/{adminid}/{adminpassword}")
	public ResponseEntity<Map<String, Object>> checkifadminexists(@PathVariable("adminid") int id,
			@PathVariable("adminpassword") String password) throws SQLException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		if (dao.checkUserThere(id)) {
			map.put("success", dao.checkUserThere(id));
			return ResponseEntity.ok(map);
		} else {
			AdminPOJO a1 = new AdminPOJO();
			a1.setId(id);
			a1.setPassword(password);
			if (dao.insertadmin(a1) == 1) {
				map.put("registered", true);
			} else {
				map.put("registered", false);
			}
		}
		return ResponseEntity.ok(map);
	}

	@ResponseBody
	@GetMapping("/gettherespectivemovies/{certificateofmovie}")
	public ResponseEntity certificateofmovie(@PathVariable("certificateofmovie") String ccom)
			throws IOException, SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = audienceDAO.gettherespectivemovies(ccom);
		if (list != null) {
			map.put("listofmovies", list);
		}

		return ResponseEntity.ok(map);
	}

	@ResponseBody
	@GetMapping("/createaudience/{aid}/{aname}/{adate}/{certificate}/{movie}/{snacks}/{feedback}/{comments}")
	public ResponseEntity<Map<String,Object>> insertAudience(
			@PathVariable("aid") int aid,
	        @PathVariable("aname") String aname,
	        @PathVariable("adate") String adate,
	        @PathVariable("certificate") String certificate,
	        @PathVariable("movie") String movie,
	        @PathVariable("snacks") String snacks,
	        @PathVariable("feedback") String feedback,
	        @PathVariable("comments") String comments) throws SQLException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		AudiencePOJO a1 = new AudiencePOJO();
		a1.setAid(aid);
		a1.setAname(aname);
		a1.setBeveragesnacks(snacks);
		a1.setMovies(movie);
		a1.setImprovement(comments);
		a1.setFeedback(feedback);
		a1.setCertificates(certificate);
		a1.setDate(adate);
		System.out.println(a1);
		if(audienceDAO.insertUser(a1)==1) {
			map.put("insertion", "success");
			
		}else {
			map.put("insertion", "failed");
		}
		return ResponseEntity.ok(map);
	}
	
	@GetMapping("/audiencetable")
	public String callaudiencetable() {
		return "audiencetable";
	}
	
	@ResponseBody
	@GetMapping("/getallusers")
	public ResponseEntity<Map<String,Object>> getallusers() throws SQLException, IOException{
		Map<String, Object> map = new HashMap<String, Object>();
		List<AudiencePOJO> l1 = audienceDAO.selectAllAudience();
		map.put("list", l1);
		return ResponseEntity.ok(map);
	}
}
