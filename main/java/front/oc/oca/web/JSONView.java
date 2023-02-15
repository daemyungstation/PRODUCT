package front.oc.oca.web;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.view.AbstractView;

import net.sf.json.JSONObject;

public class JSONView extends AbstractView {
    
    private HttpStatus httpStatus = null;
    private Map<String, String> header = null;
    
    public JSONView() {
        setContentType("text/json; charset=utf-8");
    }
    
    public JSONView(HttpStatus httpStatus, Map<String, String> header) {
        this.httpStatus = httpStatus;
        this.header = header;
        setContentType("text/json; charset=utf-8");
    }

    @Override
    protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception {
        JSONObject jsonObject = JSONObject.fromObject(map);
        response.setContentType("text/json; charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        if (httpStatus != null) {
            response.setStatus(this.httpStatus.value());
        }
        if (header != null) {
            for (String key : this.header.keySet()) {
                response.setHeader(key, header.get(key));
            }
        }
        PrintWriter out = response.getWriter();
        out.write(jsonObject.toString());
        out.flush();

    }
}
