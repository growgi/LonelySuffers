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


	public String uploadLessonPhoto(String savePath, MultipartFile file, int houseNo) {
		String filename = file.getOriginalFilename();
		String extention = filename.substring(filename.lastIndexOf("."));
	//실제 업로드할 파일명
		String numbering = String.format("%08d", houseNo);
		String filepath = numbering+extention;
		try {
			FileOutputStream fos = new FileOutputStream(savePath+filepath);
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return filepath;
	}

	public String uploadHousePhoto1(String savePath, MultipartFile file, int houseNo) {
		String filename = file.getOriginalFilename();
		String extention = filename.substring(filename.lastIndexOf("."));
	//실제 업로드할 파일명
		String numbering = String.format("%08d", houseNo);
		String filepath = numbering+"_1"+extention;
		try {
			FileOutputStream fos = new FileOutputStream(savePath+filepath);
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return filepath;
	}

	public String uploadHousePhoto2(String savePath, MultipartFile file, int houseNo) {
		String filename = file.getOriginalFilename();
		String extention = filename.substring(filename.lastIndexOf("."));
	//실제 업로드할 파일명
		String numbering = String.format("%08d", houseNo);
		String filepath = numbering+"_2"+extention;
		try {
			FileOutputStream fos = new FileOutputStream(savePath+filepath);
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return filepath;
	}

	public String uploadHousePhoto3(String savePath, MultipartFile file, int houseNo) {
		String filename = file.getOriginalFilename();
		String extention = filename.substring(filename.lastIndexOf("."));
	//실제 업로드할 파일명
		String numbering = String.format("%08d", houseNo);
		String filepath = numbering+"_3"+extention;
		try {
			FileOutputStream fos = new FileOutputStream(savePath+filepath);
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return filepath;
	}

	public String uploadHousePhoto4(String savePath, MultipartFile file, int houseNo) {
		String filename = file.getOriginalFilename();
		String extention = filename.substring(filename.lastIndexOf("."));
	//실제 업로드할 파일명
		String numbering = String.format("%08d", houseNo);
		String filepath = numbering+"_4"+extention;
		try {
			FileOutputStream fos = new FileOutputStream(savePath+filepath);
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return filepath;
	}

	public boolean deleteFile(String savePath, String filepath) {
		File delFile = new File(savePath+filepath);
		return delFile.delete();
	}
}
