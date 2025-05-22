package appointment;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.*;
import java.time.LocalDate;
import java.util.*;

@WebServlet("/view_appointments")
public class ViewAppointmentsServlet extends HttpServlet {

    private static final String FILE_PATH = "C:\\Users\\Mirahi\\Desktop\\Data\\appointment.txt";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Session check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedIn") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Appointment> appointments = new ArrayList<>();
        Gson gson = new Gson();

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                try {
                    Appointment appointment = gson.fromJson(line, Appointment.class);
                    appointments.add(appointment);
                } catch (Exception e) {
                    System.err.println("Invalid appointment JSON: " + line);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Could not read appointments.");
            return;
        }

        // Sort appointments using Selection Sort by date
        for (int i = 0; i < appointments.size() - 1; i++) {
            int minIndex = i;
            LocalDate minDate = parseDate(appointments.get(i).getDate());

            for (int j = i + 1; j < appointments.size(); j++) {
                LocalDate dateJ = parseDate(appointments.get(j).getDate());
                if (dateJ.isBefore(minDate)) {
                    minIndex = j;
                    minDate = dateJ;
                }
            }

            if (minIndex != i) {
                Collections.swap(appointments, i, minIndex);
            }
        }

        request.setAttribute("appointments", appointments);
        request.getRequestDispatcher("/appointmentsList.jsp").forward(request, response);
    }

    private LocalDate parseDate(String dateStr) {
        try {
            return LocalDate.parse(dateStr);
        } catch (Exception e) {
            return LocalDate.MAX;
        }
    }
}
