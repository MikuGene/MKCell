package com.MK.action;

import java.io.File;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class MKuclustCN {
	private File[] MKup;
	private String MKfty;
	private String MKmethod;
	private String MKcent;
	private String MKscal;
	private String MKlabel;
	
    public File[] getUpload() {return MKup;}
    public void setUpload(File[] a) {this.MKup = a;}
    
    public String getFty() {return MKfty;}
    public void setFty(String Fty) {this.MKfty = Fty;}

    public String getMethod() {return MKmethod;}
    public void setMethod(String Method) {this.MKmethod = Method;}
    
    public String getCent() {return MKcent;}
    public void setCent(String Cent) {this.MKcent = Cent;}
    
    public String getScal() {return MKscal;}
    public void setScal(String Scal) {this.MKscal = Scal;}
    
    public String getLabel() {return MKlabel;}
    public void setLabel(String Label) {this.MKlabel = Label;}
    
    public String MKupcltCN() throws RserveException, InterruptedException{
    	try {
    		HttpServletRequest request = ServletActionContext.getRequest();
    		HttpSession session = request.getSession();
    		
    		int MKdir = (int) session.getAttribute("useid");
    		String MKpath = ServletActionContext.getServletContext().getRealPath("/MKupload/"+MKdir);
    		for(int i = 0; i < MKup.length; i++) {
    		File MKdest = new File(MKpath, "MKclt" + i);
    		FileUtils.copyFile(MKup[i], MKdest);}
    		
    		int Rcmd = MKdir + 8100;
    		Runtime.getRuntime().exec("R CMD Rserve --RS-port " + Rcmd);
    		TimeUnit.SECONDS.sleep(2);
    		RConnection rc = new RConnection(null,Rcmd);
    		
    		try{
    			rc.eval("Udir <- \""+MKdir+"\" ");
    			rc.eval("Fty <- \""+MKfty+"\" ");
    			rc.eval("Method <- \""+MKmethod+"\" ");
    			rc.eval("Cent <- \""+MKcent+"\" ");
    			rc.eval("Scal <- \""+MKscal+"\" ");
    			rc.eval("Label <- \""+MKlabel+"\" ");
    			rc.eval("Num <- \""+MKup.length+"\" ");
    			rc.eval("source(\"D:/MKr/MK_clust.r\")");
    			rc.shutdown();}
    		catch(Exception e){
    			rc.shutdown();}
    		}
    	catch (IOException e) {e.printStackTrace();}
    	return "MKrecltCN";}
}
