package com.xjm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.UUID;

@Controller
@RequestMapping("/file")
public class FileController {
        //springmvc文件上传
        @RequestMapping("/upload")
        public String upload(HttpServletRequest request, MultipartFile upload) throws Exception{
            System.out.println("SpringMVC文件上传...");
            //使用upload组件完成上传
            //上传的位置
            String path = request.getSession().getServletContext().getRealPath("/uploads/");
            //判断路径是否存在
            File file = new File(path);
            if(!file.exists()){
                file.mkdirs();
            }
            //说明上传文件项，获取上传文件的名称
            String filename = upload.getOriginalFilename();
            //把文件的名称设置唯一值uuid
            String uuid = UUID.randomUUID().toString().replace("-", "");
            filename=uuid+"_"+filename;
            //完成文件上传
            upload.transferTo(new File(path,filename));
            System.out.println(path);
            return "success";

        }
        //文件下载
        @RequestMapping("/download")
        public String downLoad(HttpServletResponse response) throws UnsupportedEncodingException {
            String filename="实习岗位清单.txt";
            String filePath = "G:\\学习\\final" ;
            File file = new File(filePath + "/" + filename);
            if(file.exists()){ //判断文件父目录是否存在
                response.setContentType("application/vnd.ms-excel;charset=UTF-8");
                response.setCharacterEncoding("UTF-8");
                // response.setContentType("application/force-download");
                response.setHeader("Content-Disposition", "attachment;fileName=" +   java.net.URLEncoder.encode(filename,"UTF-8"));
                byte[] buffer = new byte[1024];
                FileInputStream fis = null; //文件输入流
                BufferedInputStream bis = null;
                OutputStream os = null; //输出流
                try {
                    os = response.getOutputStream();
                    fis = new FileInputStream(file);
                    bis = new BufferedInputStream(fis);
                    int i = bis.read(buffer);
                    while(i != -1){
                        os.write(buffer);
                        i = bis.read(buffer);
                    }
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                System.out.println("----------file download---" + filename);
                try {
                    bis.close();
                    fis.close();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
            return null;
        }
    }

