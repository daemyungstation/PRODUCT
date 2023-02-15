package front.oc.oca.service.impl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;
import java.security.Security;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import egovframework.com.cmm.service.impl.EgovFileMngServiceImpl;
import org.apache.http.Header;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.stereotype.Service;
import com.fasterxml.jackson.databind.ObjectMapper;
import emf.core.vo.EmfMap;
import front.oc.oca.service.BankingService;
import front.oc.oca.service.dao.OCAOutsourcingDAO;

import org.bouncycastle.jce.provider.BouncyCastleProvider;
@Service("doznBankingService")

public class DoznBankingServiceImpl implements BankingService {

	public static final Logger logger = Logger.getLogger(DoznBankingServiceImpl.class.getName());
	@Resource(name="oCAOutsourcingDAO")
	private OCAOutsourcingDAO oCAOutsourcingDAO;


    /**
     * <pre>
     * 1. MethodName : inquireDepositor
     * 2. ClassName  : CommonAccountServiceImpl.java
     * 3. Comment    : 예금주 조회
     * 4. 작성자       : upleat    
     * 5. 작성일       : 2020. 4. 29.
     * </pre>
     */
    
    public Map<String, Object> inquireDepositor(EmfMap emfMap) {
    	Security.addProvider(new BouncyCastleProvider());
    	int telegramNo = oCAOutsourcingDAO.selectTelegramNo(emfMap);
    	
    	HttpPost post = new HttpPost("https://gw-firm.dozn.co.kr/api/rt/v1/inquireDepositor");
    	
    	String accountNum = emfMap.getString("accountNum");
        String bankCode = emfMap.getString("bankCode");
    	
    	JSONObject requestBody = new JSONObject();
        requestBody.put("api_key", "bf8fa95e-62c9-4597-81fb-b2ac6822434a");
        requestBody.put("org_code", "10000073");
        requestBody.put("telegram_no", telegramNo);
        requestBody.put("bank_code", bankCode);
        requestBody.put("account", accountNum);
        
        post.addHeader("content-type", "application/json");
    	try {
			post.setEntity(new StringEntity(requestBody.toString()));
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	String res = "";
		try {
			
			CloseableHttpClient httpClient = HttpClients.createDefault();
			CloseableHttpResponse response = httpClient.execute(post);

			res = EntityUtils.toString(response.getEntity());
			response.close();
			httpClient.close();
		} catch (Exception e){
			e.printStackTrace();
		}
		System.out.println(res);
    	
		Map<String, Object> resultMap = new HashMap<String, Object>();
        try {
            DoznBankingResponse response = new ObjectMapper().readValue(res, DoznBankingResponse.class);
            if (response.getStatus() == 200) {
                resultMap.put("result", true);
                resultMap.put("depositor", response.getDepositor());
            } else if (response.getStatus() == 520) {
                resultMap.put("result", false);
                resultMap.put("message", response.getError_message());
            } else {
                resultMap.put("result", false);
                resultMap.put("message", "처리 중 오류 [ " + response.getStatus() + "-" + response.getError_code() + " ]");
            }
        } catch (IOException e) {
            resultMap.put("result", false);
            resultMap.put("message", "처리 중 오류");
        }

        return resultMap;
    	
    }        

    private static class DoznBankingResponse {
        private int status; // 응답 상태 코드
        private String error_code; // 은행 오류코드
        private String error_message; // 은행 오류 메세지
        private String natv_tr_no; // 더즌 거래번호
        private String request_at; // 요청일시
        private String depositor; // 예금주명
		public int getStatus() {
			return status;
		}
		public void setStatus(int status) {
			this.status = status;
		}
		public String getError_code() {
			return error_code;
		}
		public void setError_code(String error_code) {
			this.error_code = error_code;
		}
		public String getError_message() {
			return error_message;
		}
		public void setError_message(String error_message) {
			this.error_message = error_message;
		}
		public String getNatv_tr_no() {
			return natv_tr_no;
		}
		public void setNatv_tr_no(String natv_tr_no) {
			this.natv_tr_no = natv_tr_no;
		}
		public String getRequest_at() {
			return request_at;
		}
		public void setRequest_at(String request_at) {
			this.request_at = request_at;
		}
		public String getDepositor() {
			return depositor;
		}
		public void setDepositor(String depositor) {
			this.depositor = depositor;
		}
        
    }
    
    /**
     * <pre>
     * 1. MethodName : inquireDepositor
     * 2. ClassName  : CommonAccountServiceImpl.java
     * 3. Comment    : 예금주 조회
     * 4. 작성자       : upleat    
     * 5. 작성일       : 2020. 4. 29.
     * </pre>
     */
    
    public Map<String, Object> inicisDepositor(EmfMap emfMap) {    	
    	
    	String accountNum = emfMap.getString("accountNum");
        String strBankCd = emfMap.getString("bankCode");    	
        String strRtnCode = "";
        String strRtnName = "";   
        String cmsMsg = "";   
        String ActionUrl = "https://iniweb-api.inicis.com/api/acctCheck.jsp";                        
        
        Map<String, String> param = new HashMap();
        Map<String, Object> resultMap = new HashMap<String, Object>();
                
		param.put("mid", "daemyungim");
		param.put("banksett",strBankCd);
		param.put("noacct", accountNum);
		param.put("rltURL", "https://test.com");		
						
	try {    	    	   
			String res = processHTTP(ActionUrl, param);   	
			Map<String, String> resMap = splitQuery(res);
			
    		strRtnName = resMap.get("strRet").toString();
    		cmsMsg = resMap.get("strErrMsg").toString();
    		strRtnCode = resMap.get("code").toString();    		    		
    		
    		if (!strRtnCode.equals("000")){
    			resultMap.put("result", false);
                resultMap.put("message", "처리 중 오류 [ " + cmsMsg + "-" + strRtnCode + " ]");	
    		} else {    			
                resultMap.put("result", true);
                resultMap.put("depositor", strRtnName);
    		}
            		
	   } catch (Exception e) {
           e.printStackTrace();
           resultMap.put("result", false);
           resultMap.put("message", "</br> 처리 중 오류 [ " + e.getMessage() + " ]");	
           System.out.println(e.getMessage());
       }  
	
	 	return resultMap;
    }
    
    /************************************************************************************************************************
    *  통장이름 확인에 필요한 메소드 
    /***********************************************************************************************************************/
	public static String processHTTP(String url, Map<String, String> params) throws Exception {
		HttpPost post = new HttpPost(url);

		List<NameValuePair> urlParameters = new ArrayList(params.size());
		for (Map.Entry<String, String> entry : params.entrySet()) {
			urlParameters.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		post.setEntity(new UrlEncodedFormEntity(urlParameters, "euc-kr"));

		String res = "";
		CloseableHttpClient httpClient = HttpClients.createDefault();
		CloseableHttpResponse response = null;
		try {
			response = httpClient.execute(post);
		} catch (Exception e){
			logger.warn("processHTTP: {}", params,  e);
		} finally {
			if (response != null) {
				Header[] headerNames = response.getAllHeaders();
				for (Header header : headerNames) {
					if (header.getName().equals("Location"))
						res = header.getValue();
				}

				response.close();
				httpClient.close();
			}
		}
		return res;
	}
	
	public static Map<String, String> splitQuery(String location) throws UnsupportedEncodingException, Exception
	{
		Map<String, String> query_pairs = new LinkedHashMap<String, String>();
		URL url = new URL(location);

		String query = url.getQuery();
		String[] pairs = query.split("&");
		for (String pair : pairs)
		{
			int idx = pair.indexOf("=");
			query_pairs.put(URLDecoder.decode(pair.substring(0, idx), "utf-8"), URLDecoder.decode(pair.substring(idx + 1), "utf-8"));
		}
		return query_pairs;
	}

}
