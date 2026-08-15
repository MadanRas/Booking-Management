package com.journal.AudiencePOJO;

public class AudiencePOJO {

	private int aid;
	
	private String aname;
	
	private String date;
	
	private String certificates;
	
	private String movies;
	
	private String beveragesnacks;
	
	private String feedback;
	
	private String improvement;

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getCertificates() {
		return certificates;
	}

	public void setCertificates(String certificates) {
		this.certificates = certificates;
	}

	public String getMovies() {
		return movies;
	}

	public void setMovies(String movies) {
		this.movies = movies;
	}

	public String getBeveragesnacks() {
		return beveragesnacks;
	}

	public void setBeveragesnacks(String beveragesnacks) {
		this.beveragesnacks = beveragesnacks;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public String getImprovement() {
		return improvement;
	}

	public void setImprovement(String improvement) {
		this.improvement = improvement;
	}

	@Override
	public String toString() {
		return "AudiencePOJO [aid=" + aid + ", aname=" + aname + ", date=" + date + ", certificates=" + certificates
				+ ", movies=" + movies + ", beveragesnacks=" + beveragesnacks + ", feedback=" + feedback
				+ ", improvement=" + improvement + "]";
	}

	public AudiencePOJO(int aid, String aname, String date, String certificates, String movies, String beveragesnacks,
			String feedback, String improvement) {
		super();
		this.aid = aid;
		this.aname = aname;
		this.date = date;
		this.certificates = certificates;
		this.movies = movies;
		this.beveragesnacks = beveragesnacks;
		this.feedback = feedback;
		this.improvement = improvement;
	}

	public AudiencePOJO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
