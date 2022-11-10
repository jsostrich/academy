package com.teamfour.board.model;

import java.sql.Timestamp;

public class BoardVO {
	private int write_no; /* NUMBER NOT NULL 글번호 */
	private int user_no; /* NUMBER 회원번호 */
	private String title;  /* VARCHAR2(30) NOT NULL 제목 */
	private String writer; /* VARCHAR2(30) NOT NULL 작성자 */
	private Timestamp regdate; /* DATE DEFAULT sysdate 작성일 */
	private int read; /* NUMBER NOT NULL 조회 */
	private String content; /* CLOB 글내용 */
	private String filename; /* VARCHAR2(50) 첨부파일 */
	private Long file_size; /* NUMBER 파일크기 */
	
	public BoardVO() {
		super();
		read = 0;
	}

	public BoardVO(int write_no, int user_no, String title, String writer, Timestamp regdate, int read, String content,
			String filename, Long file_size) {
		super();
		this.write_no = write_no;
		this.user_no = user_no;
		this.title = title;
		this.writer = writer;
		this.regdate = regdate;
		this.read = read;
		this.content = content;
		this.filename = filename;
		this.file_size = file_size;
	}
	
	public int getWrite_no() {
		return write_no;
	}

	public void setWrite_no(int write_no) {
		this.write_no = write_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getRead() {
		return read;
	}

	public void setRead(int read) {
		this.read = read;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Long getFile_size() {
		return file_size;
	}

	public void setFile_size(Long file_size) {
		this.file_size = file_size;
	}

	@Override
	public String toString() {
		return "BoardVO [write_no=" + write_no + ", user_no=" + user_no + ", title=" + title + ", writer=" + writer
				+ ", regdate=" + regdate + ", read=" + read + ", content=" + content + ", filename=" + filename
				+ ", file_size=" + file_size + "]";
	}
}


