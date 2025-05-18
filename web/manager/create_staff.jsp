<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Staff | Vehicle Parts WMS</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        /* Maintain same styling as dashboard */
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
        
        .form-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            max-width: 600px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <!-- Left Sidebar (Same as Dashboard) -->
    <div class="sidebar p-3">
        <h4 class="mb-4">WMS Manager</h4>
        <nav class="nav flex-column">
            <a class="nav-link" href="${pageContext.request.contextPath}/ManagerDashboardServlet">
                <i class="fas fa-tachometer-alt me-2"></i>Dashboard
            </a>
            <div class="sidebar-section">STAFF MANAGEMENT</div>
            <a class="nav-link active-nav" href="<c:url value='/manager/create_staff.jsp'/>">
                <i class="fas fa-user-plus me-2"></i>Create Staff
            </a>
            <!-- Other navigation links -->
        </nav>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3>Create New Staff Account</h3>
            <div class="d-flex align-items-center">
                <span class="me-3 text-muted">
                    <i class="fas fa-user-circle me-2"></i>
                    <%= session.getAttribute("username") %>
                </span>
                <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn btn-sm btn-outline-secondary">
                    <i class="fas fa-sign-out-alt"></i>
                </a>
            </div>
        </div>
                    <% String msg = (String) request.getAttribute("message"); %>
                    <% if (msg != null) { %>
                    <p style="color: green;"><%= msg %></p>
                    <% } %>


        <!-- Create Staff Form -->
        <div class="form-card p-4">
            <form action="${pageContext.request.contextPath}/userCreateServlet" method="POST">

                <!-- Name Field -->
                <div class="mb-3">
                    <label class="form-label">
                        <i class="fas fa-user me-2"></i>Full Name
                    </label>
                    <input type="text" 
                           class="form-control" 
                           name="name" 
                           required
                           placeholder="John Doe">
                </div>

                <!-- Username Field -->
                <div class="mb-3">
                    <label class="form-label">
                        <i class="fas fa-at me-2"></i>Username
                    </label>
                    <input type="text" 
                           class="form-control" 
                           name="username" 
                           required
                           placeholder="johndoe">
                </div>

                <!-- Password Field -->
                <div class="mb-4">
                    <label class="form-label">
                        <i class="fas fa-lock me-2"></i>Password
                    </label>
                    <input type="password" 
                           class="form-control" 
                           name="password" 
                           required
                           placeholder="••••••••"
                           minlength="8">
                </div>

                <!-- Role Field (Disabled) -->
                <div class="mb-4">
                    <label class="form-label">
                        <i class="fas fa-user-tag me-2"></i>Role
                    </label>
                    <input type="text" 
                           class="form-control" 
                           value="Staff" 
                           disabled
                           readonly>
                    <input type="hidden" name="role" value="staff">
                </div>

                <!-- Submit Button -->
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary btn-lg">
                        <i class="fas fa-user-plus me-2"></i>Create Staff Account
                    </button>
                </div>

                <!-- Error Message -->
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger mt-3">
                        ${errorMessage}
                    </div>
                </c:if>
            </form>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>