<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="js/jquery.min.js"></script>

 <div class="sidebar" data-background-color="white" data-active-color="danger">


    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="#" class="simple-text">
                 	   小型办公系统后台管理系统
                </a>
            </div>

            <ul class="nav">
                <li>
                    <a href="${domain }/userTable.do">
                        <i class="ti-user"></i>
                        <p>用户管理</p>
                    </a>
                </li>
                <li>
                    <a href="${domain }/rcapTable.do">
                        <i class="ti-user"></i>
                        <p>日程管理</p>
                    </a>
                </li>
                 <li>
                    <a href="${domain }/emailTable.do">
                        <i class="ti-user"></i>
                        <p>公司邮件管理</p>
                    </a>
                </li>
                 <li>
                    <a href="${domain }/conferenceTable.do">
                        <i class="ti-user"></i>
                        <p>会议管理</p>
                    </a>
                </li>
                 <li>
                    <a href="${domain }/salaryTable.do">
                        <i class="ti-text"></i>
                        <p>薪水管理</p>
                    </a>
                </li>
                <li>
                    <a href="${domain }/newsTable.do">
                        <i class="ti-text"></i>
                        <p>新闻管理管理</p>
                    </a>
                </li>
                <li>
                    <a href="${domain }/logout.do">
                        <i class="ti-text"></i>
                        <p>注销</p>
                    </a>
                </li>
            </ul>
    	</div>
    </div>
