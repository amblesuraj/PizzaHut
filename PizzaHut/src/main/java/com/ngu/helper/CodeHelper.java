package com.ngu.helper;

import java.io.ByteArrayOutputStream;
import java.util.Hashtable;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.Writer;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.oned.Code128Writer;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

public class CodeHelper {

	
		public static byte[] getQRCodeImage(String text,int width,int height)
		{
			try {
				
				QRCodeWriter qrCodeWriter = new QRCodeWriter();
				BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, width, height);
				ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
				MatrixToImageWriter.writeToStream(bitMatrix, "png", byteArrayOutputStream);
				return byteArrayOutputStream.toByteArray();
			}
			catch(Exception exception)
			{
				exception.printStackTrace();
				return null;
			}
		}
		
		
		
		
		public static byte[] getBarcodeImage(String text,int width,int height)
		{
			
			try
			{
				
				Hashtable<EncodeHintType, ErrorCorrectionLevel> hintmap = new Hashtable<>();
				hintmap.put(EncodeHintType.ERROR_CORRECTION,ErrorCorrectionLevel.L);
				Writer writer = new Code128Writer();
				BitMatrix bitMatrix = writer.encode(text, BarcodeFormat.CODE_128, width, height);
				
				ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
				MatrixToImageWriter.writeToStream(bitMatrix, "png", byteArrayOutputStream);
				return byteArrayOutputStream.toByteArray();
				
			}
			catch(Exception exception)
			{
				exception.printStackTrace();
				return null;
			}
			
		}
	
	
}
