package user;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {
    // Allowed paths without authentication
    private static final String[] PUBLIC_PATHS = {
            "/index.jsp", "/", "/home.jsp",
            "/login", "/login.jsp",
            "/register", "/register.jsp",
            "/about.jsp", "/contact.jsp",
            "/buy.jsp", "/rent.jsp", "/agents.jsp",
            "/css/", "/js/", "/images/", "/assets/",
            "/error.jsp"
    };

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());

        // Check if the path is public
        if (isPublicPath(path)) {
            chain.doFilter(request, response);
            return;
        }

        // Check authentication for private paths
        HttpSession session = httpRequest.getSession(false);
        if (session == null || session.getAttribute("loggedIn") == null) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp?redirect=" + path);
            return;
        }

        chain.doFilter(request, response);
    }

    private boolean isPublicPath(String path) {
        // Allow root context path
        if (path.equals("/")) {
            return true;
        }

        // Check against allowed public paths
        for (String publicPath : PUBLIC_PATHS) {
            if (path.startsWith(publicPath)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void destroy() {}
}