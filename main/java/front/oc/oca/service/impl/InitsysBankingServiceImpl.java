//package front.oc.oca.service.impl;
//
//import com.fasterxml.jackson.databind.ObjectMapper;
//import emf.core.vo.EmfMap;
//import front.oc.oca.service.BankingService;
//import front.oc.oca.service.dao.OCAOutsourcingDAO;
//import org.apache.http.client.methods.CloseableHttpResponse;
//import org.apache.http.client.methods.HttpPost;
//import org.apache.http.entity.StringEntity;
//import org.apache.http.impl.client.CloseableHttpClient;
//import org.apache.http.impl.client.HttpClients;
//import org.apache.http.util.EntityUtils;
//import org.bouncycastle.jce.provider.BouncyCastleProvider;
//import org.json.JSONObject;
//import org.springframework.stereotype.Service;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.annotation.Resource;
//import java.io.IOException;
//import java.io.UnsupportedEncodingException;
//import java.security.Security;
//import java.util.HashMap;
//import java.util.Map;
//
//@Service("inicisBankingService")
//public class InitsysBankingServiceImpl implements BankingService {
//
//	@Resource(name="oCAOutsourcingDAO")
//	private OCAOutsourcingDAO oCAOutsourcingDAO;
//
//
//    /**
//     * <pre>
//     * 1. MethodName : inquireDepositor
//     * 2. ClassName  : CommonAccountServiceImpl.java
//     * 3. Comment    : 예금주 조회
//     * 4. 작성자       : upleat
//     * 5. 작성일       : 2020. 4. 29.
//     * </pre>
//     */
//    @Override
//    public Map<String, Object> inquireDepositor(EmfMap emfMap) {
//		// 에러코드및 메시지
//		String szErrorCode = "0";
//		String szErrorMsg = "OK";
//		String strRtnName = "";											//결과 계좌명
//		String strRtnErrMsg = "";											//결과 메세지
//		String strRtnCode = "";												//결과 코드
//		boolean result = true;
//		try
//		{
//
//			String strBankNo = emfMap.getString("accountNum");  //계좌번호
//			String strBankCd = emfMap.getString("bankCode"); //은행코드
////			String strName = (String)mapInVar.get("nmcomp");		//이름
////			String strMid = (String)mapInVar.get("mid");				//MID
////
////
////
////			String ActionUrl = "https://iniweb-api.inicis.com/api/acctCheck.jsp";
////
////			Map<String, String> param = new HashMap<>();
////			param.put("mid", strMid);
////			param.put("banksett", strBankCd);
////			param.put("noacct", strBankNo);
////			param.put("rltURL", "https://test.com");
////
////			String res = "";
////			try {
////
////				HttpPost post = new HttpPost(ActionUrl);
////
////				JSONObject requestBody = new JSONObject();
////				requestBody.put("api_key", "bf8fa95e-62c9-4597-81fb-b2ac6822434a");
////				requestBody.put("org_code", "10000073");
////				requestBody.put("telegram_no", telegramNo);
////				requestBody.put("bank_code", bankCode);
////				requestBody.put("account", accountNum);
////
////				post.addHeader("content-type", "application/json");
////				try {
////					post.setEntity( new Map).setEntity(param);
////				} catch (UnsupportedEncodingException e1) {
////					// TODO Auto-generated catch block
////					e1.printStackTrace();
////				}
////
////				CloseableHttpClient httpClient = HttpClients.createDefault();
////				CloseableHttpResponse response = httpClient.execute(post);
////
////				res = EntityUtils.toString(response.getEntity());
////				response.close();
////				httpClient.close();
////			} catch (Exception e){
////				e.printStackTrace();
////			}
////			System.out.println(res);
////
////
////			String res = processHTTP(ActionUrl, param);
////			Map<String, String> resMap = splitQuery(res);
////
////			strRtnName = resMap.get("strRet").toString();
////			strRtnErrMsg = resMap.get("strErrMsg").toString();
////			strRtnCode = resMap.get("code").toString();
////
////			if (strRtnCode.equals("000")){
////				if (!strRtnName.equals(strName)){
////					strRtnErrMsg = "예금주명이 상이합니다. 확인바랍니다 ("+strRtnName+")";
////					result = false;
////				}
////			}
//		}
//		catch (Exception e)
//		{
//			e.printStackTrace();
//			szErrorCode = "-1";
//			szErrorMsg = e.getMessage();
//			szErrorMsg =  "처리 중 오류";
//			result = false;
//		}
//
//		Map<String, Object> resultMap = new HashMap<String, Object>();
//		resultMap.put("result", result);
//		resultMap.put("depositor", strRtnName);
//		resultMap.put("message", strRtnErrMsg);
//		resultMap.put("errorCode", szErrorCode);
//		return resultMap;
//
//    }
//
//}
