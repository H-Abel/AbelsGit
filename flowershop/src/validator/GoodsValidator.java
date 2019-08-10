package validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.po.Goods;
@Component
public class GoodsValidator implements Validator{
	@Override
	public boolean supports(Class<?> klass) {
		return Goods.class.isAssignableFrom(klass);
	}

	@Override
	public void validate(Object object,Errors errors) {
		Goods goods=(Goods)object;
		ValidationUtils.rejectIfEmpty(errors, "gname", "goods.gname.required");
		ValidationUtils.rejectIfEmpty(errors, "gdescribe", "goods.gdescribe.required");
//		if(goods.getGoprice()<=0) {
//			errors.rejectValue("goprice", "goprice.invalid");
//		}
//		if(goods.getGnprice()<=0) {
//			errors.rejectValue("gnprice", "gnprice.invalid");
//		}
		if(goods.getGstore()<0) {
			errors.rejectValue("gstore", "gstore.invalid");
		}
		
	}
}
