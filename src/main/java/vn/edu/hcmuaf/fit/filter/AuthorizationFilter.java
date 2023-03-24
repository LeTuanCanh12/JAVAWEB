package vn.edu.hcmuaf.fit.filter;

import vn.edu.hcmuaf.fit.model.UserModel;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AuthorizationFilter implements Filter {
    private ServletContext context;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String url = request.getRequestURI();
        if (url.startsWith("/admin")) {
            UserModel user = (UserModel) request.getSession().getAttribute("user");
            if(user != null) {
                if (user.getAuthorities() == 2 || user.getAuthorities() == 3) {
                    filterChain.doFilter(servletRequest, servletResponse);
                }else if(user.getAuthorities() ==1) {
//                    response.sendRedirect(request.getContextPath()+ "/LoginControl");
                    request.getRequestDispatcher("views/web/login.jsp").forward(request, response);
                }

            }else  {
//                response.sendRedirect(request.getContextPath()+ "/LoginControl");
                request.getRequestDispatcher("views/web/login.jsp").forward(request, response);
            }
        }else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
