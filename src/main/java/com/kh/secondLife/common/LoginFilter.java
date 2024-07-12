package com.kh.secondLife.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.secondLife.member.model.vo.Member;

/**
 * Servlet Filter implementation class LoginFilter
 */
@SessionAttributes({"loginUser"})
@WebFilter(urlPatterns = {
			"/member/*",
			"/board/*"
})
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(
			ServletRequest request,
			ServletResponse response,
			FilterChain chain,
			Model model,
			RedirectAttributes ra
			) throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
		
		List<String> approvedPaths = Arrays.asList("/member/signup", "/board/list", "/board/detail");
		
		if (approvedPaths.contains(path)) {
            chain.doFilter(request, response);
        }
		
		Member loginUser = (Member) model.getAttribute("loginUser");
		if (loginUser != null && !loginUser.getName().isBlank()) {
			chain.doFilter(request, response);
		} else {
			ra.addFlashAttribute("alertMsg", "로그인 시 이용할 수 있는 컨텐츠입니다.");
			httpResponse.sendRedirect("/");
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
