package com.tianshi.tools;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

import java.io.IOException;

public class UploadFile {
	//TODO 配置namenode的ip
	private String HOST_NAME = "";
	private String FS_DEFAULT_NAME = String.format("hdfs://%s:8020/", HOST_NAME);
	private String MAPRED_JOB_TRACKER = String.format("%s:8021", HOST_NAME);
	
	Configuration conf;
	
	public UploadFile(){
		conf = new Configuration();
		conf.set("fs.default.name", FS_DEFAULT_NAME);
		conf.set("mapred.job.tracker", MAPRED_JOB_TRACKER);
		conf.set("hadoop.job.user", "wugui");
	}
	
	public Configuration getConf() {
		return conf;
	}

	/**
	 * args[0] localMainPath
	 * args[1] localSubPath
	 * args[2] hdfsPath
	 * @param args
	 */

	
	/**
	 * 初始化HDFS目录。  存在就删除
	 * @param fs
	 * @param p
	 * @throws IOException
	 */
	private void initHdfs(FileSystem fs ,Path p) throws IOException{
		if(fs.exists(p)){
			fs.delete(p ,true);				
		}
		fs.mkdirs(p);
	}
	
	/**
	 * 上传wenjian 操作
	 * @param fs
	 * @param name 文件名称
	 * @param src1  本地路径
	 * @param   dst hdfs路径
	 * @throws IOException
	 */
	public void doUploadVideo(FileSystem fs ,String name , String src1 ,String dst) throws IOException{
		String src =src1+"/"+name ;
		Path srcPath = new Path(src); //本地上传文件路径
		Path dstPath = new Path(dst); //hdfs目标路径
		fs.copyFromLocalFile(srcPath,dstPath);
	}

}
