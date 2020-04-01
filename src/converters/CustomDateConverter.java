package converters;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

/*
 * S:���ݹ���������
 * T:ת���������
 * **/
public class CustomDateConverter implements Converter<String, Date> {

	public Date convert(String arg0) {
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
		try {
			return simpleDateFormat.parse(arg0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
