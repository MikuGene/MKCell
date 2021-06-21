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

public class MKdeCN {
	
	private File[] MKup;
	private String MKfty;
	private String MKadj;
	private String MKpval;
	private String MKplim;
	private String MKlfc;
	private String MKlfclim;
	
    public File[] getUpload() {return MKup;}
    public void setUpload(File[] a) {this.MKup = a;}
    
    public String getFty() {return MKfty;}
    public void setFty(String Fty) {this.MKfty = Fty;}

    public String getAdj() {return MKadj;}
    public void setAdj(String Adj) {this.MKadj = Adj;}
    
    public String getPval() {return MKpval;}
    public void setPval(String Pval) {this.MKpval = Pval;}
    
    public String getPlim() {return MKplim;}
    public void setPlim(String Plim) {this.MKplim = Plim;}
    
    public String getLfc() {return MKlfc;}
    public void setLfc(String Lfc) {this.MKlfc = Lfc;}
    
    public String getLfclim() {return MKlfclim;}
    public void setLfclim(String Lfclim) {this.MKlfclim = Lfclim;}
    
    
    public String MKupdeCN() throws RserveException, InterruptedException{
    	try {
    		HttpServletRequest request = ServletActionContext.getRequest();
    		HttpSession session = request.getSession();
    		
    		int MKdir = (int) session.getAttribute("useid");
    		String MKpath = ServletActionContext.getServletContext().getRealPath("/MKupload/"+MKdir);
    		for(int i = 0; i < MKup.length; i++) {
    		File MKdest = new File(MKpath, "MKde" + i);
    		FileUtils.copyFile(MKup[i], MKdest);}
    		
    		int Rcmd = MKdir + 8100;
    		Runtime.getRuntime().exec("R CMD Rserve --RS-port " + Rcmd);
    		TimeUnit.SECONDS.sleep(2);
    		RConnection rc = new RConnection(null,Rcmd);
    		
    		try{
    			rc.eval("Udir <- \""+MKdir+"\" ");
    			rc.eval("Fty <- \""+MKfty+"\" ");
    			rc.eval("Adj <- \""+MKadj+"\" ");
    			rc.eval("Pval <- \""+MKpval+"\" ");
    			rc.eval("Lfc <- \""+MKlfc+"\" ");
    			rc.eval("Plim <- \""+MKplim+"\" ");
    			rc.eval("Lfclim <- \""+MKlfclim+"\" ");
    			rc.eval("source(\"D:/MKr/MK_de.r\")");
    			rc.shutdown();}
    		catch(Exception e){
    			rc.shutdown();}
    		}
    	catch (IOException e) {e.printStackTrace();}
    	return "MKredeCN";}
}
