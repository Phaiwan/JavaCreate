package cz.jiripinkas.jba.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import javax.validation.Constraint;
import javax.validation.Payload;

import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;




@Target({ FIELD })
@Retention(RUNTIME)
@Documented
@Constraint(validatedBy = {UniqueUsernameValidator.class })
public @interface UniqueUsername {

	String message();

	Class<?>[] groups() default { };

	Class<? extends Payload>[] payload() default { };
}
