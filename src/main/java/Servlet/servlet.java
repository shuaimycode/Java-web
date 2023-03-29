package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class servlet
 */
@WebServlet("/servlet")
public class servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.setCharacterEncoding("utf-8"); //1
        response.setContentType("text/html;charset=utf-8"); //2
        response.setCharacterEncoding("utf-8"); //3
        
        List<String> list=new ArrayList<>();
    	String stopname = request.getParameter("stopname");
    	
    	//拓展一下：通过reuqest对象调用getWriter得到PrintWriter对象，
        //我们可以利用这个来响应ajax，定义一个字符串通过PrintWriter调用print方法来将字符串发送给ajax
        //PrintWriter prin = response.getWriter();
        // massge = "Success!";
        //prin.print(massge);
    	
        list.add(stopname);
        System.out.println(stopname);
        list.add("xiaoming");
        list.add("xiaoqiang");
        list.add("xiaogang");
        request.setAttribute("stop3",list);
        request.getRequestDispatcher("find1.jsp").forward(request,response);
        
        /*
        String method = request.getParameter("method");
        if (method.equals("find1")) {
            List<String> list=new ArrayList<>();
            String line=request.getParameter("line");
            list.add(line);
            System.out.println(line);
            list.add("xiaoming");
            list.add("xiaoqiang");
            list.add("xiaogang");
            request.setAttribute("stop",list);
            request.getRequestDispatcher("find1.jsp").forward(request,response);

        } else {
        	List<String> list=new ArrayList<>();
        	String stopname = request.getParameter("stopname");
        	
        	//拓展一下：通过reuqest对象调用getWriter得到PrintWriter对象，
            //我们可以利用这个来响应ajax，定义一个字符串通过PrintWriter调用print方法来将字符串发送给ajax
            PrintWriter prin = response.getWriter();
            String massge = "Success!";
            prin.print(massge);
        	
        	list.add(stopname);
            System.out.println(stopname);
            list.add("xiaoming");
            list.add("xiaoqiang");
            list.add("xiaogang");
            request.setAttribute("stop3",list);
            request.getRequestDispatcher("find1.jsp").forward(request,response);
        }
        */
    }

}

