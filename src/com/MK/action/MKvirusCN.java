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

public class MKvirusCN {
	private File[] MKup;
	private String MKmism;
	
    public File[] getUpload() {return MKup;}
    public void setUpload(File[] a) {this.MKup = a;}
    
    public String getMism() {return MKmism;}
    public void setMism(String Mism) {this.MKmism = Mism;}

    public String MKupvirusCN() throws RserveException, InterruptedException{
    	try {
    		HttpServletRequest request = ServletActionContext.getRequest();
    		HttpSession session = request.getSession();
    		
    		int MKdir = (int) session.getAttribute("useid");
    		String MKpath = ServletActionContext.getServletContext().getRealPath("/MKupload/"+MKdir);
    		for(int i = 0; i < MKup.length; i++) {
    		File MKdest = new File(MKpath, "MKvirus" + i);
    		FileUtils.copyFile(MKup[i], MKdest);}
    		
    		int Rcmd = MKdir + 8100;
    		Runtime.getRuntime().exec("R CMD Rserve --RS-port " + Rcmd);
    		TimeUnit.SECONDS.sleep(2);
    		RConnection rc = new RConnection(null,Rcmd);
 
    		try{
    			rc.eval("Udir <- \""+MKdir+"\" ");
    			rc.eval("Mism <- \""+MKmism+"\" ");
    			rc.eval("source(\"D:/MKr/MK_virmap.r\")");
    			rc.shutdown();}
    		catch(Exception e){
    			rc.shutdown();
    			}
    		
    		}
    	catch (IOException e) {e.printStackTrace();}
    	return "MKrevirusCN";}
}
