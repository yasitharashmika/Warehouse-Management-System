<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Messages to Manager</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        /* Include your theme styles */
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
        
        .stat-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
        }
        
        .table-responsive {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <!-- Left Sidebar -->
    <div class="sidebar p-3">
        <h4 class="mb-4">WMS Manager</h4>
        <nav class="nav flex-column">
            <!-- Dashboard -->
            <a class="nav-link" href="${pageContext.request.contextPath}/ManagerDashboardServlet">
                <i class="fas fa-tachometer-alt me-2"></i>Dashboard
            </a>

            <!-- Message Section -->
            <div class="sidebar-section">MESSAGES</div>
            <a class="nav-link" href="${pageContext.request.contextPath}/sendMessage.jsp">
                <i class="fas fa-paper-plane me-2"></i>Send Messages
            </a>
            <a class="nav-link active-nav" href="${pageContext.request.contextPath}/ViewManagerMessagesServlet">
                <i class="fas fa-inbox me-2"></i>Inbox
            </a>

            <!-- Include other sidebar sections as needed -->
        </nav>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3><i class="fas fa-inbox me-2"></i>Messages Sent to Manager</h3>
            <div class="d-flex align-items-center">
                <span class="me-3 text-muted">
                    <i class="fas fa-user-circle me-2"></i>
                    ${sessionScope.username}
                </span>
                <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn btn-sm btn-outline-secondary">
                    <i class="fas fa-sign-out-alt"></i>
                </a>
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
                <i class="fas fa-info-circle me-2"></i>No messages found in your inbox.
            </div>
        </c:if>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>