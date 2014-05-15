package org.sum;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SummarizationServlet
 */
public class SummarizationServlet
        extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        run(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        run(request, response);
    }

    private void run(HttpServletRequest request, HttpServletResponse response)
            throws IOException
    {
        // TODO: Use parameter "stop".
        // Write input into input file.
        write(request.getParameter("input"), ARESConstants.SUM_INPUT);
        // Run jar file to generate output.
        float percent = Integer.parseInt(request.getParameter("percent")) / 100f;
        Process p = Runtime.getRuntime().exec("java -jar " + ARESConstants.SUM_JAR + " " + percent);
        try {
            p.waitFor();
        } catch (InterruptedException e) {
            new IOException(e);
        }
        // Read output from output file and response to HTTP request.
        write(read(ARESConstants.SUM_OUTPUT), response);
    }
    
    private String read(File file)
            throws IOException
    {
        StringBuilder sb = new StringBuilder();
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader(file));
            String line = null;
            while ((line = br.readLine()) != null) {
                sb.append(line).append("\n");
            }
        } finally {
            if (br != null) {
                br.close();
            }
        }
        return sb.toString();
    }

    private void write(String info, File outFile)
            throws IOException
    {
        BufferedWriter bw = null;
        try {
            bw = new BufferedWriter(new FileWriter(outFile));
            bw.write(info);
        } finally {
            if (bw != null) {
                bw.close();
            }
        }
    }

    private void write(String info, HttpServletResponse response)
            throws IOException
    {
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(info);
    }
}
