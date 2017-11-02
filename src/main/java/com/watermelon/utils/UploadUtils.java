package com.watermelon.utils;

import java.io.File;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;


public class UploadUtils {

    private static final Logger logger = LogManager.getLogger(UploadUtils.class);

    //获得文件扩展名，返回值包括点 .
    public static String getExtension(String filename) {
        return filename.substring(filename.lastIndexOf('.'), filename.length());
    }

    //使用七牛云上传文件
    public static void uploadWithQiniu(File file, String accessKey, String secretKey, String bucket) {
        

    }
}
