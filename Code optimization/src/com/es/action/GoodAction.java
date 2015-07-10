/**
 * 
 */
package com.es.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import com.es.service.GoodService;
import com.es.vo.CategoryInfo;
import com.es.vo.GoodInfo;
import com.opensymphony.xwork2.ActionContext;

/**
 * ������Ʒ���action
 * 
 * @author slave_1
 */
@Namespace("/good")
@SuppressWarnings("static-access")
public class GoodAction extends AbstractAction {

	private static final long serialVersionUID = 1L;

	public GoodInfo good;
	public List<GoodInfo> goods = new ArrayList<GoodInfo>();

	private GoodService goodService = new GoodService();

	private int page = 1;
	private int goodNum;
	private int pageNum;

	public final static int PAGE_SIZE = 12;

	private File uploadFile;
	private String uploadFileContentType; // �õ��ϴ����ļ�����������,
	private String uploadFileFileName; // �õ��ϴ����ļ�������

	@Override
	public GoodInfo getModel() {
		if (good == null) {
			good = new GoodInfo();
		}
		return good;
	}

	@Action(value = "listAll", results = { @Result(location = "content.jsp", type = "dispatcher") })
	public String listAll() {
System.out.println("actionproxy  " + ActionContext.getContext().getActionInvocation().getProxy().getClass() + "  actioncontext" + ActionContext.getContext() + " Thead " + Thread.currentThread().getName());
		CategoryInfo c = new CategoryInfo();
		c.setId(good.getId());
		List<CategoryInfo> cs = new ArrayList<CategoryInfo>();
		cs.add(c);
		good.setCategories(cs);
		// goods = goodService.findAll(good);
		goodNum = goodService.countGood(good);
		setPageNum();
		goods = goodService.findAll(good, page);
System.out.println("page " + page + " " + goods.size());
		return this.SUCCESS;
	}

	@Action(value = "detail", results = {
			@Result(location = "detail.jsp"),
			@Result(name = "FAILURE", location = "/user/login.jsp", type = "redirect") })
	public String view() {
		if (session.get("user") == null) {
			return "FAILURE";
		}
		good = goodService.find(good);
		return this.SUCCESS;
	}

	@Action(value = "publish", results = {
			@Result(location = "detail", params = { "id", "${good.getId()}" }, type = "redirect"),
			@Result(name = "FAILURE", location = "/user/login.jsp", type = "redirect") })
	public String newGood() {
		if (session.get("user") == null) {
			return "FAILURE";
		}
		receiveFile();
		good.setImgSrc(this.uploadFileFileName);
		goodService.create(good);
		return this.SUCCESS;
	}

	/**
	 * ͼƬ�ϴ�
	 */
	private void receiveFile() {
		String realPath = ServletActionContext.getServletContext().getRealPath(
				"/static/image");
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMddhhmmss");
		String dateTime = date.format(new Date());
//		realPath += dateTime;
		String suffix = this.uploadFileFileName.substring(this.uploadFileFileName.lastIndexOf("."));
		uploadFileFileName = dateTime+suffix;
System.out.println(this.uploadFileFileName);

		// ����ͼƬ����
		if (uploadFileContentType.equals("image/gif")
				|| uploadFileContentType.equals("image/jpeg")
				|| uploadFileContentType.equals("image/png")
				|| uploadFileContentType.equals("image/bmp")
				|| uploadFileContentType.equals("image/x-icon")
				|| uploadFileContentType.equals("image/pjpeg")) {
//System.out.println(uploadFile.length());
			// �ж��ļ��Ƿ�Ϊ��,�����ļ����ܴ���2M
			if (uploadFile != null && uploadFile.length() < 2097152) {
				// ���� parent ����·������ child ·�����ַ�������һ���� File ʵ����
				File filePath = new File(new File(realPath), uploadFileFileName);
				// �ж�·���Ƿ����
				if (!filePath.getParentFile().exists()) {
					// ��������ڣ���ݹ鴴����·��
					filePath.getParentFile().mkdirs();
				}
//System.out.println(uploadFileFileName);
//System.out.println(filePath.getParentFile());
				// ���ļ����浽Ӳ����,Struts2��������Զ�ɾ����ʱ�ļ�
				try {
					FileUtils.copyFile(uploadFile, filePath);
				} catch (IOException e) {
					System.out.println("ͼƬ�ϴ�ʧ��");
					e.printStackTrace();
				}
			}
		}
	}

	public int getGoodNum() {
		return goodNum;
	}

	public void setGoodNum(int goodNum) {
		this.goodNum = goodNum;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum() {
		if (this.goodNum % PAGE_SIZE == 0)
			this.pageNum = this.goodNum / PAGE_SIZE;
		else
			this.pageNum = this.goodNum / PAGE_SIZE + 1;
	}

	public String getUploadFileContentType() {
		return uploadFileContentType;
	}

	public void setUploadFileContentType(String uploadFileContentType) {
		this.uploadFileContentType = uploadFileContentType;
	}

	public String getUploadFileFileName() {
		return uploadFileFileName;
	}

	public void setUploadFileFileName(String uploadFileFileName) {
		this.uploadFileFileName = uploadFileFileName;
	}

	public File getUpload() {
		return uploadFile;
	}

	public void setUploadFile(File upload) {
		this.uploadFile = upload;
	}

}
