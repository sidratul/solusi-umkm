package com.sidratul.solusiumkm.koneksi;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URI;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.params.ConnManagerParams;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;

import android.util.Log;

public class CustomHttpClient {
	
	public static final int HTTP_TIMEOUT= 30 * 1000;
	
	private static HttpClient httpClient;
	
	private static HttpClient getHttpClient(){
		if(httpClient==null){
			httpClient = new DefaultHttpClient();
			
			final HttpParams params = httpClient.getParams();
			HttpConnectionParams.setConnectionTimeout(params, HTTP_TIMEOUT);
			HttpConnectionParams.setSoTimeout(params, HTTP_TIMEOUT);
			ConnManagerParams.setTimeout(params, HTTP_TIMEOUT);
			
		}
		
		return httpClient;
	}
	
	public static String executeHttpPost(String url,List<NameValuePair> postParameters) throws Exception{
		BufferedReader in = null;
		
		try{
			HttpClient client = getHttpClient();
			HttpPost request = new HttpPost(url);
			
			UrlEncodedFormEntity formEntity = new UrlEncodedFormEntity(postParameters);
			
			request.setEntity(formEntity);
			HttpResponse response = client.execute(request);
			
			final int status = response.getStatusLine().getStatusCode();
			
			in = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
			
			StringBuffer sb = new StringBuffer("");
			String line = "";
			String LN = System.getProperty("line.separator");
			
			while((line = in.readLine()) != null ){
				sb.append(line+LN);
			}
			
			in.close();
			String result = sb.toString();
			return result;

	    }finally{
			if(in !=null){
				try{
					in.close();
				}catch(IOException e){
					Log.e("log_tag", "error converting result "+e.toString());
					e.printStackTrace();
				}
				
			}
		}
	}
	
	public static String executeHttpGet(String url) throws Exception{
		BufferedReader in = null;
		
		try{
			HttpClient client = getHttpClient();
			HttpGet request = new HttpGet();
			
			request.setURI(new URI(url));
			
			HttpResponse response = client.execute(request);
			
			in = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
			
			StringBuffer sb = new StringBuffer("");
			String line = "";
			String LN = System.getProperty("line.separator");
			
			while((line = in.readLine()) != null ){
				sb.append(line+LN);
			}
			
			in.close();
			String result = sb.toString();
			return result;
		}finally{
			if(in !=null){
				try{
					in.close();
				}catch(IOException e){
					Log.e("log_tag", "error converting result "+e.toString());
					e.printStackTrace();
				}
				
			}
		}
	}
}
