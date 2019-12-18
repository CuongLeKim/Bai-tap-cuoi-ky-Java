package com.nhomjava.other;

import javax.servlet.http.HttpServletRequest;

import net.tanesha.recaptcha.ReCaptcha;
import net.tanesha.recaptcha.ReCaptchaFactory;
import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;

public class XCaptcha {
	// Đăng ký key tại đây: https://www.google.com/recaptcha/admin/create
	public static String publicKey = "6LeHjVUUAAAAAEVFu2tqVf-17TcUnY5KWn7HCq-Z";
	public static String privateKey = "6LeHjVUUAAAAAC9w4V3Li6biPDGqNwXDRQNYjY80";
	/*
	 * public static String publicKey =
	 * "6LcWJ-wSAAAAAPwUVEj2uAR_xtji6vOSSwV8h8AH"; public static String
	 * privateKey = "6LcWJ-wSAAAAAASWwBIJ7nLU3H6Ngy2lEtzkx1DU";
	 */

	public static String render() {
		ReCaptcha c = ReCaptchaFactory.newReCaptcha(publicKey, privateKey, false);
		return c.createRecaptchaHtml(null, null);
	}

	public static boolean isValid(HttpServletRequest request) {
		String remoteAddr = request.getRemoteAddr();
		ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
		reCaptcha.setPrivateKey(privateKey);

		String challenge = request.getParameter("recaptcha_challenge_field");
		String uresponse = request.getParameter("recaptcha_response_field");
		ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);

		return reCaptchaResponse.isValid();
	}
}
