<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Staff Dashboard</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
        }
        
        body {
            background-color: #f8f9fa;
            min-height: 100vh;
        }
        
        .sidebar {
            background-color: var(--primary-color);
            min-height: 100vh;
            color: white;
            width: 250px;
            position: fixed;
        }
        
        .main-content {
            margin-left: 250px;
            padding: 20px;
        }
        
        .table-responsive {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            padding: 20px;
        }
        
        .nav-link {
            color: rgba(255,255,255,0.8);
            transition: all 0.3s ease;
            padding: 12px 15px !important;
            border-radius: 8px;
            margin: 2px 0;
        }
        
        .nav-link:hover {
            color: white;
            background: rgba(255,255,255,0.1);
        }
        
        .active-nav {
            background: rgba(255,255,255,0.15);
            color: white !important;
        }
    </style>
</head>
<body>
    

    <!-- Left Sidebar -->
    <div class="sidebar p-3">
        <h4 class="mb-4">Staff Portal</h4>
        <nav class="nav flex-column">
            <a class="nav-link" href="${pageContext.request.contextPath}/StaffDashboardServlet">
                <i class="fas fa-tachometer-alt me-2"></i>Dashboard
            </a>

            <!-- Message Section -->
            <div class="sidebar-section" style="color: rgba(255,255,255,0.6); padding: 1rem 1rem 0.5rem;">
                MESSAGES
            </div>
            <a class="nav-link " href="${pageContext.request.contextPath}/ViewStaffMessagesServlet">
                <i class="fas fa-inbox me-2"></i>Inbox
            </a>
            <a class="nav-link" href="${pageContext.request.contextPath}/sendMessage.jsp">
                <i class="fas fa-paper-plane me-2"></i>Send Message
            </a>
        </nav>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3><i class="fas fa-inbox me-2"></i>Staff Inbox</h3>
            <div class="d-flex align-items-center">
                <div class="dropdown">
                    <button class="btn btn-link text-dark text-decoration-none dropdown-toggle" 
                            type="button" id="userMenu" data-bs-toggle="dropdown">
                        <i class="fas fa-user-circle me-2"></i>
                        ${sessionScope.user.username}
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="#">Profile Settings</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item text-danger" 
                               href="${pageContext.request.contextPath}/LogoutServlet">
                                <i class="fas fa-sign-out-alt me-2"></i>Logout
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Messages Table -->
        <div class="table-responsive">
            <table class="table table-hover table-striped">
                <thead class="table-light">
                    <tr>
                        <th scope="col">Sender</th>
                        <th scope="col">Subject</th>
                        <th scope="col">Message</th>
                        <th scope="col">Sent At</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="msg" items="${messages}">
                        <tr>
                            <td>${msg.sender}</td>
                            <td>${msg.subject}</td>
                            <td>${msg.message}</td>
                            <td><fmt:formatDate value="${msg.sentAt}" pattern="MMM dd, yyyy HH:mm"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Empty State -->
        <c:if test="${empty messages}">
            <div class="alert alert-info mt-4">
                <i class="fas fa-inbox-open me-2"></i>Your inbox is currently empty
            </div>
        </c:if>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>