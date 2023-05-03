package common;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class errorUtil {
	
			//500에러
			@ExceptionHandler(Exception.class)
			public String handleException(Exception e) {
				System.err.println("----------------------------------");
				System.err.println("에러발생");
				System.err.println(e.getMessage());
				System.err.println("----------------------------------");
				return "common/error500";
			}
			
			//404에러
			@ExceptionHandler(NoHandlerFoundException.class)
			@ResponseStatus(value= HttpStatus.NOT_FOUND)
			public String notFound(NoHandlerFoundException e ) {
				System.err.println("----------------------------------");
				System.err.println("RequestMapping오류");
				System.err.println(e.getMessage());
				System.err.println("----------------------------------");
				return "common/error404";
			}
}
