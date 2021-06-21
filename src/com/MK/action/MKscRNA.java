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

public class MKscRNA {
  
  private File MKup;
  private String MKfty;
  private String MKreso;
  private String MKgenea;
  private String MKgenex;
  private String MKnvar;
  private String MKdim;
  private String MKsct;
  private String MKbatch;
  private String MKnorm;
  private String MKumap;
  
  public File getUpload() {return MKup;}
  public void setUpload(File a) {this.MKup = a;}
  
  public String getFty() {return MKfty;}
  public void setFty(String Fty) {this.MKfty = Fty;}
  public String getReso() {return MKreso;}
  public void setReso(String Reso) {this.MKreso = Reso;}
  
  public String getGenea() {return MKgenea;}
  public void setGenea(String Genea) {this.MKgenea = Genea;}
  public String getGenex() {return MKgenex;}
  public void setGenex(String Genex) {this.MKgenex = Genex;}
  
  public String getNvar() {return MKnvar;}
  public void setNvar(String Nvar) {this.MKnvar = Nvar;}
  public String getDim() {return MKdim;}
  public void setDim(String Dim) {this.MKdim = Dim;}
  public String getSct() {return MKsct;}
  public void setSct(String Sct) {this.MKsct = Sct;}
  public String getBatch() {return MKbatch;}
  public void setBatch(String Batch) {this.MKbatch = Batch;}
  public String getNorm() {return MKnorm;}
  public void setNorm(String Norm) {this.MKnorm = Norm;}
  public String getUmap() {return MKumap;}
  public void setUmap(String Umap) {this.MKumap = Umap;}
  
  public String MKupscRNA() throws RserveException, InterruptedException, IOException{
    
    HttpServletRequest request = ServletActionContext.getRequest();
    HttpSession session = request.getSession();
    
    int MKdir = (int) session.getAttribute("useid");
    String MKpath = ServletActionContext.getServletContext().getRealPath("/MKupload/"+MKdir);
    File MKdest = new File(MKpath, "MKscRNA");
    FileUtils.copyFile(MKup, MKdest);
    
    int Rcmd = MKdir + 8100;
    Runtime.getRuntime().exec("R CMD Rserve --RS-port " + Rcmd);
    TimeUnit.SECONDS.sleep(2);
    RConnection rc = new RConnection(null,Rcmd);
    
    try{
      rc.eval("Udir <- \""+MKdir+"\" ");
      rc.eval("Fty <- \""+MKfty+"\" ");
      rc.eval("Reso <- \""+MKreso+"\" ");
      rc.eval("Genea <- \""+MKgenea+"\" ");
      rc.eval("Genex <- \""+MKgenex+"\" ");
      rc.eval("Nvar <- \""+MKnvar+"\" ");
      rc.eval("Dim <- \""+MKdim+"\" ");
      rc.eval("Sct <- \""+MKsct+"\" ");
      rc.eval("Batch <- \""+MKbatch+"\" ");
      rc.eval("Norm <- \""+MKnorm+"\" ");
      rc.eval("Umap <- \""+MKumap+"\" ");
      rc.eval("source(\"D:/MKr/MK_scRNA.r\")");
      rc.shutdown();}
    catch(Exception e){
      rc.shutdown();}
    return "MKrescRNA";
  }
}