package com.hobby.my.member.vo;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	
	private String memId;        /* 회원 아이디 */
	private String memPw;        /* 회원 비밀번호 */
	private String memNic;       /* 회원 닉네임 */
	private String memJob;       /* 회원 직업 */
	private String memMbti;      /* 회원  MBTI */
	private String memBirth;     /* 회원 생일 */
	private String memGender;    /* 회원 성별 */
	private String memHob;       /* 회원 취미 */
	private String profileImg;   /* 회원 프로필 */
	private String useYn;        /* 삭제 여부 */
	private String updateDt;     /* 수정 일 */
	private String createDt;     /* 생성 일 */
	private MultipartFile profileImgFile;    /* 이미지파일 */
	
	
	public MultipartFile getProfileImgFile() {
		return profileImgFile;
	}
	public void setProfileImgFile(MultipartFile profileImgFile) {
		this.profileImgFile = profileImgFile;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemNic() {
		return memNic;
	}
	public void setMemNic(String memNic) {
		this.memNic = memNic;
	}
	public String getMemJob() {
		return memJob;
	}
	public void setMemJob(String memJob) {
		this.memJob = memJob;
	}
	public String getMemMbti() {
		return memMbti;
	}
	public void setMemMbti(String memMbti) {
		this.memMbti = memMbti;
	}
	public String getMemBirth() {
		return memBirth;
	}
	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}
	public String getMemGender() {
		return memGender;
	}
	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}
	public String getMemHob() {
		return memHob;
	}
	public void setMemHob(String memHob) {
		this.memHob = memHob;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getUpdateDt() {
		return updateDt;
	}
	public void setUpdateDt(String updateDt) {
		this.updateDt = updateDt;
	}
	public String getCreateDt() {
		return createDt;
	}
	public void setCreateDt(String createDt) {
		this.createDt = createDt;
	}
	@Override
	public String toString() {
		return "MemberVO [memId=" + memId + ", memPw=" + memPw + ", memNic=" + memNic + ", memJob=" + memJob
				+ ", memMbti=" + memMbti + ", memBirth=" + memBirth + ", memGender=" + memGender + ", memHob=" + memHob
				+ ", profileImg=" + profileImg + ", useYn=" + useYn + ", updateDt=" + updateDt + ", createDt="
				+ createDt + ", profileImgFile=" + profileImgFile + "]";
	}

	
	
	


}
