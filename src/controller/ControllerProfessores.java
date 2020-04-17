package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Professor;

@WebServlet("/CadastroProfe")
public class ControllerProfessores extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
		handleRequest(req, resp);
	}

	protected void doPost(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {

		handleRequest(req, resp);
	}

	private void handleRequest(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {

		Professor p;
		List<Professor> professors;

		if (req.getSession().getAttribute("professores") == null) {
			professors = new ArrayList<Professor>();
			req.getSession().setAttribute("professores", professors);
		} else {
			professors = (ArrayList) req.getSession().getAttribute("professores");
		}

		if (req.getParameter("updateProfessor") != null) {
			int pId = Integer.parseInt(req.getParameter("updateProfessor"));
			p = professors.get(pId);
		} else {
			p = new Professor();
			professors.add(p);
		}

		p.setNome(req.getParameter("txtnome"));
		p.setEmail(req.getParameter("txtemail"));
		p.setTelefone(req.getParameter("txttelefone"));
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		try {
			p.setDataNasc(format.parse(req.getParameter("txtdtnasc")));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		// req.setAttribute(GREETING_REQUEST_PARAMETER_KEY, greeting);
		req.getRequestDispatcher("ProfessoresView.jsp").forward(req, resp);
	}

}
