package utility;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Utility {
	// 업로드된 파일의 정보를 반환해주는 메소드 작성
	// multi : 업로드 하고자 하는 멀티 파트 객체
	// realPath : 실제로 이미지가 업로드 되는 위치
	public static File getUploadedFileInfo(MultipartFile multi, String realPath) {
		
		String pattern = "yyyyMMddhhmmss"; //날짜 패턴
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		String now = sdf.format(new Date()); //현재시각을 문자열로
		
		String somefile = multi.getOriginalFilename();
		System.out.println("somefile : " + somefile);
		
		int dot = somefile.indexOf(".");// 도트의 위치
		
		String filename = somefile.substring(0,dot);// 파일 이름
		
		String fileext = somefile.substring(dot); // 파일의 확장자
		
		String newfile = filename + now + fileext;// 신규로 만들어질 파일 이름
		
		String myfile = realPath + File.separator + newfile;
		
		//myfile은 일반 문자열이기때문에 객체생성해서 리턴해준다.
		return new File(myfile);
	}

}
