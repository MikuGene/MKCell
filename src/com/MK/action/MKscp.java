package com.MK.action;

import java.io.File;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class MKscp {
	
	private String MKTgene;
	private String MKscD;
	
    public String getTgene() {return MKTgene;}
    public void setTgene(String Tgene) {this.MKTgene = Tgene;}
    
    public String getScD() {return MKscD;}
    public void setScD(String ScD) {this.MKscD = ScD;}
    
    public String MKupscp() throws RserveException, IOException, InterruptedException{

    		HttpServletRequest request = ServletActionContext.getRequest();
    		HttpSession session = request.getSession();
    		
    		int MKdir = (int) session.getAttribute("useid");
    		String MKpath = ServletActionContext.getServletContext().getRealPath("/MKupload/"+MKdir);
    		File file= new File(MKpath);
    		file.mkdir();
    		
    		int Rcmd = MKdir + 8100;
    		Runtime.getRuntime().exec("R CMD Rserve --RS-port " + Rcmd);
    		TimeUnit.SECONDS.sleep(2);
    		RConnection rc = new RConnection(null,Rcmd);
    		
    		try{
    			rc.eval("Udir <- \""+MKdir+"\" ");
    			rc.eval("Gene <- \""+MKTgene+"\" ");
    			rc.eval("ScT <- \""+MKscD+"\" ");
    			rc.eval("source(\"D:/MKr/MK_scplot.r\")");
    			rc.shutdown();}
    		catch(Exception e){
    			rc.shutdown();}
    	return "MKrescp";
    	}
}
