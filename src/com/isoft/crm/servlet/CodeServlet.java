package com.isoft.crm.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.isoft.crm.util.SessionUtils;


public class CodeServlet extends HttpServlet{
	//Creating random characters.
	private static char[] chars = "abcdefghiljkmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
	private static Random random = new Random();
	public static String getSum(int length){
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			sb.append(chars[random.nextInt(chars.length)]);
		}
		return sb.toString();
	}
	public static Color randColor(){
		int x = random.nextInt(256);
		int y = random.nextInt(256);
		int z = random.nextInt(256);
		Color color = new Color(x, y ,z);
		return color;
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {	
				int width = 80;
				int height = 34;
				//1.Creating and setting a canvas and a brush
				BufferedImage image=new  BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
				Graphics2D graphics = image.createGraphics();
				graphics.setColor(new Color(226, 240, 249));
				graphics.fillRect(0, 0, width, height);
				
				//2.Creating and setting the random char of verification code.
				graphics.setColor(randColor());
				graphics.setFont(new Font("楷体", Font.PLAIN, 30));
				String sum = getSum(4);
				req.getSession().setAttribute(SessionUtils.RANDOMCODEKEY,sum);
//				System.out.println(sum);
//				req.getSession().setAttribute("sum", sum);
				graphics.drawString(sum, 10, 30);
				
				/*//3.Adding a frame of this canvas.
				graphics.setColor(Color.red);
				graphics.drawRect(0, 0, width-1, height-1);*/
				
				//4.Adding 4 random lines in the canvas.
				graphics.setColor(randColor());
				for (int i = 0; i < 4; i++) {
					int x1 = random.nextInt(width);
					int y1 = random.nextInt(height);
					int x2 = random.nextInt(width);
					int y2 = random.nextInt(height);
					graphics.drawLine(x1, y1, x2, y2);
				
				} 
				
				//5.Saving the canvas as a verification code.
				//graphics.dispose();
				//禁止图像缓存
				resp.setHeader("Pragma", "no-cache");
				//Cache-cControl:头域
				//no-cache:只是请求或响应消息不能缓存
				resp.setHeader("Cache-cControl", "no-cache");
				resp.setDateHeader("Expires", 0);
				resp.setContentType("image/jpeg");
				
				//6.Outputting the verification code in the screen.
				ImageIO.write(image, "jpeg", resp.getOutputStream());
				resp.getOutputStream().close();
		
		} catch (IOException e) {
				e.printStackTrace();
		}
	
	
	
	}
}
