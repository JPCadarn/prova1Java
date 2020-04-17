package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Disciplina;

@WebServlet("/CadastroDisciplina")
public class ControllerDisciplina extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
		handleRequest(req, resp);
	}

	protected void doPost(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {

		handleRequest(req, resp);
	}
	
	private void handleRequest(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
		Disciplina disciplina;
		List<Disciplina> disciplinas;

		if (req.getSession().getAttribute("disciplinas") == null) {
			disciplinas = new ArrayList<Disciplina>();
			req.getSession().setAttribute("disciplinas", disciplinas);
		} else {
			disciplinas = (ArrayList) req.getSession().getAttribute("disciplinas");
		}
		
		if(req.getParameter("idExcluir") != null) {
			disciplinas.remove(Integer.parseInt(req.getParameter("idExcluir")));
			req.getRequestDispatcher("DisciplinaView.jsp").forward(req, resp);
		}else {
	
			if (req.getParameter("id") != null) {
				int id = Integer.parseInt(req.getParameter("id"));
				disciplina = disciplinas.get(id);
			} else {
				disciplina = new Disciplina();
				disciplinas.add(disciplina);
			}
	
			disciplina.setNome(req.getParameter("nome"));
			disciplina.setCargaHoraria(Integer.parseInt(req.getParameter("cargaHoraria")));
			disciplina.setIdProfessor(Integer.parseInt(req.getParameter("idProfessor")));
			disciplina.setNumeroMaximoParticipantes(Integer.parseInt(req.getParameter("numeroParticipantes")));
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			try {
				disciplina.setDataInicio(format.parse(req.getParameter("dataInicio")));
				disciplina.setDataFim(format.parse(req.getParameter("dataFim")));
			} catch (ParseException e) {
				e.printStackTrace();
			}
	
			// req.setAttribute(GREETING_REQUEST_PARAMETER_KEY, greeting);
			req.getRequestDispatcher("DisciplinaView.jsp").forward(req, resp);
		}
	}
}