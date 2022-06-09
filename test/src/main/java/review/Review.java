package review;

public class Review {
	 private String SCORE;
	 private String POSTING_DATE;
	 private String REVIEW_CONTENTS;
	 private String EMAIL;
	 private String NICKNAME;
	 private String POST_NUM;
	 
	public String getSCORE() {
		return SCORE;
	}
	public void setSCORE(String sCORE) {
		SCORE = sCORE;
	}
	public String getPOSTING_DATE() {
		return POSTING_DATE;
	}
	public void setPOSTING_DATE(String pOSTING_DATE) {
		POSTING_DATE = pOSTING_DATE;
	}
	public String getREVIEW_CONTENTS() {
		return REVIEW_CONTENTS;
	}
	public void setREVIEW_CONTENTS(String rEVIEW_CONTENTS) {
		REVIEW_CONTENTS = rEVIEW_CONTENTS;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getNICKNAME() {
		return NICKNAME;
	}
	public void setNICKNAME(String nICKNAME) {
		NICKNAME = nICKNAME;
	}
	public String getPOST_NUM() {
		return POST_NUM;
	}
	public void setPOST_NUM(String pOST_NUM) {
		POST_NUM = pOST_NUM;
	}
}
