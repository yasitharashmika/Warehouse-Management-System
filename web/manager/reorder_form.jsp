<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reorder Stock | Vehicle Parts WMS</title>
    
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
            max-width: 800px;
            margin: 0 auto;
        }
        
        .part-search {
            position: relative;
        }
    </style>
</head>
<body>
    <!-- Left Sidebar -->
    <div class="sidebar p-3">
        <h4 class="mb-4">WMS Manager</h4>
        <nav class="nav flex-column">
            <a class="nav-link" href="${pageContext.request.contextPath}/ManagerDashboardServlet">
                <i class="fas fa-tachometer-alt me-2"></i>Dashboard
            </a>
            <div class="sidebar-section">INVENTORY CONTROL</div>
            <a class="nav-link" href="${pageContext.request.contextPath}/StockListManagerServlet">
                <i class="fas fa-boxes me-2"></i>Current Stock
            </a>
            
                <a class="nav-link" href="<c:url value='/reorderListServlet'/>">
    <i class="fas fa-list me-2"></i>Reorder List
</a>

        </nav>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3>Create New Stock Order</h3>
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
    <div class="alert alert-success" role="alert">
        <%= msg %>
    </div>
<% } %>


        <!-- Reorder Form -->
        <div class="form-card p-4">
            <form action="${pageContext.request.contextPath}/ReorderServlet" method="POST">
                <div class="row g-4">
                    
                    <!-- Part Name Text Input -->
                    <div class="col-md-6 part-search">
                        <label class="form-label">
                            <i class="fas fa-box-open me-2"></i>Part Name
                        </label>
                        <div class="position-relative">
                            <input type="text" 
                                   class="form-control" 
                                   name="partName" 
                                   required
                                   placeholder="Enter part name">
                           
                        </div>
                    </div>

                    <!-- Quantity -->
                    <div class="col-md-6">
                        <label class="form-label">
                            <i class="fas fa-hashtag me-2"></i>Quantity
                        </label>
                        <input type="number" 
                               class="form-control" 
                               name="quantity" 
                               min="1" 
                               required
                               placeholder="Enter quantity">
                    </div>

                    <!-- Supplier Information -->
                    <div class="col-12">
                        <label class="form-label">
                            <i class="fas fa-truck me-2"></i>Supplier Information
                        </label>
                        <textarea class="form-control" 
                                  name="supplierInfo" 
                                  rows="3"
                                  required
                                  placeholder="Enter supplier details"></textarea>
                    </div>

                    <!-- Delivery Date -->
                    <div class="col-md-6">
                        <label class="form-label">
                            <i class="fas fa-calendar-day me-2"></i>Expected Delivery Date
                        </label>
                        <input type="date" 
                               class="form-control" 
                               name="deliveryDate" 
                               required
                               min="<%= java.time.LocalDate.now().plusDays(1) %>">
                    </div>

                    <!-- Urgency Level -->
                    <div class="col-md-6">
                        <label class="form-label">
                            <i class="fas fa-exclamation-triangle me-2"></i>Urgency Level
                        </label>
                        <select class="form-select" name="urgency" required>
                            <option value="normal">Normal</option>
                            <option value="high">High</option>
                            <option value="critical">Critical</option>
                        </select>
                    </div>

                    <!-- Submit Button -->
                    <div class="col-12">
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary btn-lg">
                                <i class="fas fa-paper-plane me-2"></i>Submit Reorder
                            </button>
                        </div>
                    </div>

                    <!-- Error Message -->
                    <c:if test="${not empty errorMessage}">
                        <div class="col-12">
                            <div class="alert alert-danger mt-3">
                                ${errorMessage}
                            </div>
                        </div>
                    </c:if>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>