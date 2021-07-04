package com.cdkshop.service.manager;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet("/GamePictureUpload") @MultipartConfig public class GamePictureUpload extends HttpServlet {
		@Override protected void doPost(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
				//打开img文件夹或创建
				File path = new File(req.getServletContext().getRealPath("img/"));
				if (!path.exists()) {
						path.mkdir();
				}
				//写入文件
				Part img = req.getPart("file");
				String filePath = path.getPath() + File.separator + img.getSubmittedFileName();
				img.write(filePath);
				//
				req.setAttribute("success", true);
				req.setAttribute("message", "上传完成");
				req.getRequestDispatcher("Manager.jsp").forward(req, resp);
		}
}
