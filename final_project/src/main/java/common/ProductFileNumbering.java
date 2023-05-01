package common;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class ProductFileNumbering {

////////////////////////////////////////////////////////////////////
//                                                                //
//                 상품 등록 전용 FileManager.java입니다.                //
//                 파일명을 상품No로 통일시켜 업로드합니다.                  //
//                                                                //
////////////////////////////////////////////////////////////////////

	// lessonInfoPic 자리에 업로드
	public String uploadLessonPhoto(String savePath, MultipartFile file, int houseNo) {
		String filename = file.getOriginalFilename();
		String extention = filename.substring(filename.lastIndexOf("."));
		String filepath = "";
		if (extention.equalsIgnoreCase(".jpg") || extention.equalsIgnoreCase(".jpeg") || extention.equalsIgnoreCase(".png") || extention.equalsIgnoreCase(".gif") || extention.equalsIgnoreCase(".webp")) {
			String numbering = String.format("%08d", houseNo);
		// 실제 업로드할 파일명
			filepath = numbering + extention;
			try {
				FileOutputStream fos = new FileOutputStream(savePath + filepath);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				byte[] bytes = file.getBytes();
				bos.write(bytes);
				bos.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return filepath;
	}

	// housePhoto1 자리에 업로드
	public String uploadHousePhoto1(String savePath, MultipartFile file, int houseNo) {
		String filename = file.getOriginalFilename();
		String extention = filename.substring(filename.lastIndexOf("."));
		String filepath = "";
		if (extention.equalsIgnoreCase(".jpg") || extention.equalsIgnoreCase(".jpeg") || extention.equalsIgnoreCase(".png") || extention.equalsIgnoreCase(".gif") || extention.equalsIgnoreCase(".webp")) {
			String numbering = String.format("%08d", houseNo);
		// 실제 업로드할 파일명
			filepath = numbering + "_1" + extention;
			try {
				FileOutputStream fos = new FileOutputStream(savePath + filepath);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				byte[] bytes = file.getBytes();
				bos.write(bytes);
				bos.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return filepath;
	}

	// housePhoto2 자리에 업로드
	public String uploadHousePhoto2(String savePath, MultipartFile file, int houseNo) {
		String filename = file.getOriginalFilename();
		String extention = filename.substring(filename.lastIndexOf("."));
		String filepath = "";
		if (extention.equalsIgnoreCase(".jpg") || extention.equalsIgnoreCase(".jpeg") || extention.equalsIgnoreCase(".png") || extention.equalsIgnoreCase(".gif") || extention.equalsIgnoreCase(".webp")) {
			String numbering = String.format("%08d", houseNo);
		// 실제 업로드할 파일명
			filepath = numbering + "_2" + extention;
			try {
				FileOutputStream fos = new FileOutputStream(savePath + filepath);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				byte[] bytes = file.getBytes();
				bos.write(bytes);
				bos.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return filepath;
	}

	// housePhoto3 자리에 업로드
	public String uploadHousePhoto3(String savePath, MultipartFile file, int houseNo) {
		String filename = file.getOriginalFilename();
		String extention = filename.substring(filename.lastIndexOf("."));
		String filepath = "";
		if (extention.equalsIgnoreCase(".jpg") || extention.equalsIgnoreCase(".jpeg") || extention.equalsIgnoreCase(".png") || extention.equalsIgnoreCase(".gif") || extention.equalsIgnoreCase(".webp")) {
			String numbering = String.format("%08d", houseNo);
		// 실제 업로드할 파일명
			filepath = numbering + "_3" + extention;
			try {
				FileOutputStream fos = new FileOutputStream(savePath + filepath);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				byte[] bytes = file.getBytes();
				bos.write(bytes);
				bos.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return filepath;
	}

	// housePhoto4 자리에 업로드
	public String uploadHousePhoto4(String savePath, MultipartFile file, int houseNo) {
		String filename = file.getOriginalFilename();
		String extention = filename.substring(filename.lastIndexOf("."));
		String filepath = "";
		if (extention.equalsIgnoreCase(".jpg") || extention.equalsIgnoreCase(".jpeg") || extention.equalsIgnoreCase(".png") || extention.equalsIgnoreCase(".gif") || extention.equalsIgnoreCase(".webp")) {
			String numbering = String.format("%08d", houseNo);
		// 실제 업로드할 파일명
			filepath = numbering + "_4" + extention;
			try {
				FileOutputStream fos = new FileOutputStream(savePath + filepath);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				byte[] bytes = file.getBytes();
				bos.write(bytes);
				bos.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return filepath;
	}


	// 중복된 파일이름이면 덮어쓰지 않고 파일이름 뒤에 _숫자 더 붙여서 업로드
	public String upload(String savePath, MultipartFile file) {
		String filename = file.getOriginalFilename();
		//filename => test.txt -> test       .txt
		String onlyFilename = filename.substring(0, filename.lastIndexOf("."));//test
		String extention = filename.substring(filename.lastIndexOf("."));//.txt
		//실제 업로드할 파일명
		String filepath = null;
		//파일명 중복 시 뒤에 붙일 숫자
		int count = 0;
		while(true) {
			if(count == 0) {
				//첫번째 검증인 경우 숫자 붙이지 않음
				filepath = onlyFilename+extention; //text.txt
			}else {
				filepath = onlyFilename+"_"+count+extention; //text_1.txt
			}
			File checkFile = new File(savePath+filepath);
			if(!checkFile.exists()) {
				break;
			}
			count++;
		}
		try {
			//파일업로드를 위한 주스트림 생성
			FileOutputStream fos = new FileOutputStream(savePath+filepath);
			//성능향상을 위한 보조스트림 생성
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			//파일업로드
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return filepath;
	}

	public boolean deleteFile(String savePath, String filepath) {
		File delFile = new File(savePath + filepath);
		return delFile.delete();
	}
}
